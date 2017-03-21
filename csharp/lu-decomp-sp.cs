//
// Kiwi Scientific Acceleration Example - Lower/Upper Decomposition and Equation Solving.
// (C) 2014 DJ Greaves, University of Cambridge, Computer Laboratory.
//
//  Simultaneous Equations Solving using L/U decomposition. 
//  This is the single-threaded version.  
//  Parallel speedup is gained here through automatic unwind of the inner loops.
//  An explictly parallel implementation is in another demo.

using System;
using System.Text;
using KiwiSystem;
using System.Diagnostics;

//http://halcyon.usc.edu/~pk/prasannawebsite/papers/ERSAvikashd_gg.pdf
//Efficient Floating-point based Block LU Decomposition on FPGAs Vikash Daga


public class SimuSolve
{
    float [,] tmp;
    float [] yy;
    float [] xx;
    int problemSize;
    public SimuSolve(int ps) // constructor
    {
      problemSize = ps;
      tmp = new float [problemSize,problemSize];
      yy = new float[problemSize];
      xx = new float[problemSize];
    }


    
    public void LUdecompose(float [,] LL, float [,] Adata, bool pivot_enable)
    {
        //int problemSize = yy.Length;

        for (int k=0; k<problemSize; k++) { LL[k,k] = 1.0F; }
        for (int k=0; k<problemSize; k++)
            {
                for (int z=0; z<problemSize; z++) { LL[z,z] = 1.0F; }
/*              if (pivot_enable)
                    {
                        float p = 0.0;
                        int k1 = 0;
                        for(int i=k; i<problemSize; i++)
                            {
                                if (Math.Abs(Adata[i,k]) > p) // Pivoting : find largest 
                                    { p = Math.Abs(Adata[i,k]);
                                      k1 = k;
                                    }
                            }           
                        //Console.WriteLine("Pivot %d %f", k1, p);
                        float [] t = Adata[k]; Adata[k] = Adata[k1]; Adata[k1] = t;
                    }
*/
                for (int i=k+1; i<problemSize; i++)
                    {
                        Debug.Assert(Adata[k,k] != 0.0); // Singular matrix!
                        float mu = Adata[i,k]/Adata[k,k];
                        //Console.WriteLine("mu at {0} {1} is {2}", i, k, mu);
                        Adata[i,k] = 0.0F;
                        LL [i,k] = mu; // This simple store is all you need to form L.
                        for (int j=k+1; j<problemSize; j++)
                            {
                                Adata[i,j] = Adata[i,j] - mu * Adata[k,j];
                            }
                    }

            }
    }


    // Decompose to Lower and Upper. Upper is done in-place in G.
    public void DecomposeVerbose(float [,] LL, float [,] G)
    {
        Console.WriteLine("L/U Decomposition - single-threaded version.\n");
        Console.WriteLine("Initial Coefficient Matrix Pre L/U Decomposition:\n"); MatrixLib.printa(G);
        LUdecompose(LL, G, true);
        Console.WriteLine("UU="); MatrixLib.printa(G);
        Console.WriteLine("LL="); MatrixLib.printa(LL);
        Console.WriteLine("Recombine LL and RR: Should result in the original:"); MatrixLib.mpx(tmp, LL, G); MatrixLib.printa(tmp);
    }

    public float [] FwdsSubst(float [,] LL, float [] b)    // Forwards substitution to solve Ly=b
    {
        yy[0] = b[0]; 
        for (int i=1; i < problemSize; i++)
            {
                float sum = 0.0F;
                for (int j=0; j < i; j++) sum += LL[i,j] *  yy[j];
                yy[i] = b[i] - sum;
            }
        return yy;
    }

    public float [] BackSubst(float [,] UU, float [] yy)    // Back substitution to solve Ux=y
    {
        for (int i=problemSize-1; i >= 0; i--)
            {
                float sum = 0.0F;
                for (int j=i+1; j < problemSize; j++) sum += UU[i,j] * xx[j];
                xx[i] = (yy[i] - sum)/UU[i,i];
            }
        return xx;
    }



    public float [] SolveVerbose(float [,] LL, float [,] UU, float [] rhs)
    {
        float [] yy = FwdsSubst(LL, rhs); 
        Console.Write("After fwds subst="); MatrixLib.printa(yy);
        float [] xx = BackSubst(UU, yy);
        Console.Write("After back subst="); MatrixLib.printa(xx);
        return xx; // Return the final solution.
    }
}


class MatrixLib // It would be more OO to apply these methods to matrix instances.
{
    //------------------------------------------------------------------------
    // Matrix support functions now follow (there is similar code in java.utils).

    public static void printa (float [,] A)
    {
        for (int i=0; i<A.GetLength(0); i++)
            {
                Console.Write("    ");
                for (int j=0; j<A.GetLength(1); j++)
                    {
                        //if (A[i,j]==0.0) Console.Write("-.------ ", A[i,j]); else 
			Console.Write(" {0:f} ", A[i,j]);
                    }
                Console.WriteLine("");
  	        Kiwi.Pause();
            }
        Console.WriteLine("");
    }

    public static void printa (float [] AA)
    {
        Console.Write("{");
        for (int j=0; j<AA.Length; j++)
            {
            //          if (AA[j]==0.0) Console.Write("-.------ ", AA[j]);         else
                Console.Write("{0:f} ", AA[j]);
            }
	    Kiwi.Pause();
        Console.WriteLine("}");
    }


    public static float [] mpx(float [] Ans, float[,] AA, float[] BB) // Matrix multiply oblong array by column array.
    {
        for (int i=0; i<BB.Length; i++) 
            {
                float ss = 0.0F;
                for (int j=0; j<BB.Length; j++) ss += AA[i,j] * BB[j];
                Ans[i] = ss;
            }
        return Ans;
    }

    public static float [,] mpx(float [,] Ans, float[,] AA, float[,] BB) // Matrix multiply oblong arrays.
    {
        //Console.WriteLine(" mpx %d,%d with %d,%d\n", AA.Length, AA[0].Length, BB.Length, BB[0].Length);       
        //Debug.Assert(AA.GetLength(1) == BB.GetLength(0));
        for (int i=0; i<AA.GetLength(0); i++)
            for (int k=0; k < BB.GetLength(1); k++)
                {
                    float sum = 0.0F;
                    for (int j=0; j<AA.GetLength(1); j++) 
                        {
                            //Console.WriteLine(" mpx %d,%d with %d,%d %d %d %d\n", AA.Length, AA[0].Length, BB.Length, BB[0].Length, i, k, j); 
                            sum += AA[i,j] * BB[j,k];
                        }
                    Ans[i,k] = sum;
                }
        return Ans;
    }

    public static float[] [] transpose(float[] [] Ans, float[] [] AA)
    {
        for (int i=0; i<AA.Length; i++) for (int j=0; j<AA[0].Length; j++) Ans[j] [i] = AA[i] [j];
        return Ans;
    }

    public static float [,] copy2d(float[,] copy, float [,] original) // A deep clone - can we not just do a structure assign?.
     {
        for(int i = 0; i < original.GetLength(0); i++)
            {
                for (int j=0; j<original.GetLength(1); j++) copy[i,j] = original[i,j];
            }
        return copy;
    }
}


public class luTest
{
  const int problemSize = 8;
  static float [] target_rhs = new float [problemSize];
  static float [] res = new float [problemSize];
  static float [,] coefficients = new float [problemSize, problemSize];
  static float [,] LLtop = new float [problemSize, problemSize];
  static float [,] UUtop = new float [problemSize, problemSize];


  static void generate_example_rhs(int no, bool printme)
  {
     for (int i=0; i<problemSize; i++) target_rhs[i] = 1.0F + 2.0F * (float)i + 10.0F * (float)no;
     target_rhs[problemSize-1] = 2.71F;
     if (printme) for (int i=0; i<problemSize; i++)
     {   
       Console.WriteLine("  test={2}  target_rhs [{0}] == {1}", i, target_rhs[i], no);
     }
  }

  static void generate_example_coefficients()
  {
        float pp = 10.0F;
        for (int rr=0; rr<problemSize; rr++)
	    for (int cc=0; cc<problemSize; cc++)
		 { coefficients[rr,cc] = pp; pp *= 1.1F; } 
        for (int i=0; i<problemSize; i++)  // += requires Array.Address backdoor to work
        { float p = coefficients[i,i];
          coefficients[i,i] = p + 10.0F;
        }

        Console.WriteLine("Kiwi L/U demo - L/U decomposition target_rhs generated.");
  }


  [Kiwi.OutputWordPort("runstate")] static int runstate;
  [Kiwi.OutputWordPort("out_idx")] static int out_idx;
  [Kiwi.OutputWordPort("out_data")] static float out_data;

  [Kiwi.HardwareEntryPoint()]
  public static void Main()
    {
      runstate = 2; // use codepoints
       Console.WriteLine("Kiwi Demo - L/U decomposition");
       SimuSolve ssolve = new SimuSolve(problemSize);
       Kiwi.KppMark("Start");

       generate_example_coefficients();

      runstate = 3; // use codepoints
       MatrixLib.copy2d(UUtop, coefficients);   
      runstate = 4; // use codepoints
       ssolve.DecomposeVerbose(LLtop, UUtop);
      runstate = 5; // use codepoints
       Console.WriteLine("Kiwi L/U demo - coefficient matrix decomposed.");
       Kiwi.KppMark("Coefficients Created");

       for (int test=0; test<3; test++)
        {
	  runstate = 10 + test; // use codepoints
           Console.WriteLine("\nKiwi L/U demo - L/U decomposition test with rhs no {0}.", test);
           generate_example_rhs(test, true);


           float [] sol = ssolve.SolveVerbose(LLtop, UUtop, target_rhs);

           // Now see if it works as a solution
           Console.Write("Substitute back - rhs given by solution is: y="); 
           MatrixLib.printa(MatrixLib.mpx(res, coefficients, sol));     

	   runstate = 9;
	   for (int i=0; i<res.Length; i++) 
	     {
	       out_idx = i;
	       out_data = res[i];
	     }

        }
       runstate = 20;
      Kiwi.KppMark("ThreeTestsFinished");

      
      Console.WriteLine("Kiwi L/U demo - L/U decomposition demo complete at {0}.", Kiwi.tnow);
   }
}
// eof


