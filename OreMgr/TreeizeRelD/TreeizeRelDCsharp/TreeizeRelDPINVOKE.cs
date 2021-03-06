//------------------------------------------------------------------------------
// <auto-generated />
//
// This file was automatically generated by SWIG (http://www.swig.org).
// Version 3.0.12
//
// Do not make changes to this file unless you know what you are doing--modify
// the SWIG interface file instead.
//------------------------------------------------------------------------------


class TreeizeRelDPINVOKE {

  protected class SWIGExceptionHelper {

    public delegate void ExceptionDelegate(string message);
    public delegate void ExceptionArgumentDelegate(string message, string paramName);

    static ExceptionDelegate applicationDelegate = new ExceptionDelegate(SetPendingApplicationException);
    static ExceptionDelegate arithmeticDelegate = new ExceptionDelegate(SetPendingArithmeticException);
    static ExceptionDelegate divideByZeroDelegate = new ExceptionDelegate(SetPendingDivideByZeroException);
    static ExceptionDelegate indexOutOfRangeDelegate = new ExceptionDelegate(SetPendingIndexOutOfRangeException);
    static ExceptionDelegate invalidCastDelegate = new ExceptionDelegate(SetPendingInvalidCastException);
    static ExceptionDelegate invalidOperationDelegate = new ExceptionDelegate(SetPendingInvalidOperationException);
    static ExceptionDelegate ioDelegate = new ExceptionDelegate(SetPendingIOException);
    static ExceptionDelegate nullReferenceDelegate = new ExceptionDelegate(SetPendingNullReferenceException);
    static ExceptionDelegate outOfMemoryDelegate = new ExceptionDelegate(SetPendingOutOfMemoryException);
    static ExceptionDelegate overflowDelegate = new ExceptionDelegate(SetPendingOverflowException);
    static ExceptionDelegate systemDelegate = new ExceptionDelegate(SetPendingSystemException);

    static ExceptionArgumentDelegate argumentDelegate = new ExceptionArgumentDelegate(SetPendingArgumentException);
    static ExceptionArgumentDelegate argumentNullDelegate = new ExceptionArgumentDelegate(SetPendingArgumentNullException);
    static ExceptionArgumentDelegate argumentOutOfRangeDelegate = new ExceptionArgumentDelegate(SetPendingArgumentOutOfRangeException);

    [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="SWIGRegisterExceptionCallbacks_TreeizeRelD")]
    public static extern void SWIGRegisterExceptionCallbacks_TreeizeRelD(
                                ExceptionDelegate applicationDelegate,
                                ExceptionDelegate arithmeticDelegate,
                                ExceptionDelegate divideByZeroDelegate, 
                                ExceptionDelegate indexOutOfRangeDelegate, 
                                ExceptionDelegate invalidCastDelegate,
                                ExceptionDelegate invalidOperationDelegate,
                                ExceptionDelegate ioDelegate,
                                ExceptionDelegate nullReferenceDelegate,
                                ExceptionDelegate outOfMemoryDelegate, 
                                ExceptionDelegate overflowDelegate, 
                                ExceptionDelegate systemExceptionDelegate);

    [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="SWIGRegisterExceptionArgumentCallbacks_TreeizeRelD")]
    public static extern void SWIGRegisterExceptionCallbacksArgument_TreeizeRelD(
                                ExceptionArgumentDelegate argumentDelegate,
                                ExceptionArgumentDelegate argumentNullDelegate,
                                ExceptionArgumentDelegate argumentOutOfRangeDelegate);

    static void SetPendingApplicationException(string message) {
      SWIGPendingException.Set(new global::System.ApplicationException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingArithmeticException(string message) {
      SWIGPendingException.Set(new global::System.ArithmeticException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingDivideByZeroException(string message) {
      SWIGPendingException.Set(new global::System.DivideByZeroException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingIndexOutOfRangeException(string message) {
      SWIGPendingException.Set(new global::System.IndexOutOfRangeException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingInvalidCastException(string message) {
      SWIGPendingException.Set(new global::System.InvalidCastException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingInvalidOperationException(string message) {
      SWIGPendingException.Set(new global::System.InvalidOperationException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingIOException(string message) {
      SWIGPendingException.Set(new global::System.IO.IOException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingNullReferenceException(string message) {
      SWIGPendingException.Set(new global::System.NullReferenceException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingOutOfMemoryException(string message) {
      SWIGPendingException.Set(new global::System.OutOfMemoryException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingOverflowException(string message) {
      SWIGPendingException.Set(new global::System.OverflowException(message, SWIGPendingException.Retrieve()));
    }
    static void SetPendingSystemException(string message) {
      SWIGPendingException.Set(new global::System.SystemException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingArgumentException(string message, string paramName) {
      SWIGPendingException.Set(new global::System.ArgumentException(message, paramName, SWIGPendingException.Retrieve()));
    }
    static void SetPendingArgumentNullException(string message, string paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      if (e != null) message = message + " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentNullException(paramName, message));
    }
    static void SetPendingArgumentOutOfRangeException(string message, string paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      if (e != null) message = message + " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentOutOfRangeException(paramName, message));
    }

    static SWIGExceptionHelper() {
      SWIGRegisterExceptionCallbacks_TreeizeRelD(
                                applicationDelegate,
                                arithmeticDelegate,
                                divideByZeroDelegate,
                                indexOutOfRangeDelegate,
                                invalidCastDelegate,
                                invalidOperationDelegate,
                                ioDelegate,
                                nullReferenceDelegate,
                                outOfMemoryDelegate,
                                overflowDelegate,
                                systemDelegate);

      SWIGRegisterExceptionCallbacksArgument_TreeizeRelD(
                                argumentDelegate,
                                argumentNullDelegate,
                                argumentOutOfRangeDelegate);
    }
  }

  protected static SWIGExceptionHelper swigExceptionHelper = new SWIGExceptionHelper();

  public class SWIGPendingException {
    [global::System.ThreadStatic]
    private static global::System.Exception pendingException = null;
    private static int numExceptionsPending = 0;

    public static bool Pending {
      get {
        bool pending = false;
        if (numExceptionsPending > 0)
          if (pendingException != null)
            pending = true;
        return pending;
      } 
    }

    public static void Set(global::System.Exception e) {
      if (pendingException != null)
        throw new global::System.ApplicationException("FATAL: An earlier pending exception from unmanaged code was missed and thus not thrown (" + pendingException.ToString() + ")", e);
      pendingException = e;
      lock(typeof(TreeizeRelDPINVOKE)) {
        numExceptionsPending++;
      }
    }

    public static global::System.Exception Retrieve() {
      global::System.Exception e = null;
      if (numExceptionsPending > 0) {
        if (pendingException != null) {
          e = pendingException;
          pendingException = null;
          lock(typeof(TreeizeRelDPINVOKE)) {
            numExceptionsPending--;
          }
        }
      }
      return e;
    }
  }


  protected class SWIGStringHelper {

    public delegate string SWIGStringDelegate(string message);
    static SWIGStringDelegate stringDelegate = new SWIGStringDelegate(CreateString);

    [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="SWIGRegisterStringCallback_TreeizeRelD")]
    public static extern void SWIGRegisterStringCallback_TreeizeRelD(SWIGStringDelegate stringDelegate);

    static string CreateString(string cString) {
      return cString;
    }

    static SWIGStringHelper() {
      SWIGRegisterStringCallback_TreeizeRelD(stringDelegate);
    }
  }

  static protected SWIGStringHelper swigStringHelper = new SWIGStringHelper();


  static TreeizeRelDPINVOKE() {
  }


  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_writeTreeAndCreateXML")]
  public static extern string writeTreeAndCreateXML(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2, ref int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_writeTreeAndCreateJSON")]
  public static extern string writeTreeAndCreateJSON(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2, ref int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Clear")]
  public static extern void StrVector_Clear(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Add")]
  public static extern void StrVector_Add(global::System.Runtime.InteropServices.HandleRef jarg1, string jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_size")]
  public static extern uint StrVector_size(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_capacity")]
  public static extern uint StrVector_capacity(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_reserve")]
  public static extern void StrVector_reserve(global::System.Runtime.InteropServices.HandleRef jarg1, uint jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrVector__SWIG_0")]
  public static extern global::System.IntPtr new_StrVector__SWIG_0();

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrVector__SWIG_1")]
  public static extern global::System.IntPtr new_StrVector__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrVector__SWIG_2")]
  public static extern global::System.IntPtr new_StrVector__SWIG_2(int jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_getitemcopy")]
  public static extern string StrVector_getitemcopy(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_getitem")]
  public static extern string StrVector_getitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_setitem")]
  public static extern void StrVector_setitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, string jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_AddRange")]
  public static extern void StrVector_AddRange(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_GetRange")]
  public static extern global::System.IntPtr StrVector_GetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Insert")]
  public static extern void StrVector_Insert(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, string jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_InsertRange")]
  public static extern void StrVector_InsertRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_RemoveAt")]
  public static extern void StrVector_RemoveAt(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_RemoveRange")]
  public static extern void StrVector_RemoveRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Repeat")]
  public static extern global::System.IntPtr StrVector_Repeat(string jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Reverse__SWIG_0")]
  public static extern void StrVector_Reverse__SWIG_0(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Reverse__SWIG_1")]
  public static extern void StrVector_Reverse__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_SetRange")]
  public static extern void StrVector_SetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Contains")]
  public static extern bool StrVector_Contains(global::System.Runtime.InteropServices.HandleRef jarg1, string jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_IndexOf")]
  public static extern int StrVector_IndexOf(global::System.Runtime.InteropServices.HandleRef jarg1, string jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_LastIndexOf")]
  public static extern int StrVector_LastIndexOf(global::System.Runtime.InteropServices.HandleRef jarg1, string jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrVector_Remove")]
  public static extern bool StrVector_Remove(global::System.Runtime.InteropServices.HandleRef jarg1, string jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_delete_StrVector")]
  public static extern void delete_StrVector(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Clear")]
  public static extern void StrTable_Clear(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Add")]
  public static extern void StrTable_Add(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_size")]
  public static extern uint StrTable_size(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_capacity")]
  public static extern uint StrTable_capacity(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_reserve")]
  public static extern void StrTable_reserve(global::System.Runtime.InteropServices.HandleRef jarg1, uint jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTable__SWIG_0")]
  public static extern global::System.IntPtr new_StrTable__SWIG_0();

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTable__SWIG_1")]
  public static extern global::System.IntPtr new_StrTable__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTable__SWIG_2")]
  public static extern global::System.IntPtr new_StrTable__SWIG_2(int jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_getitemcopy")]
  public static extern global::System.IntPtr StrTable_getitemcopy(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_getitem")]
  public static extern global::System.IntPtr StrTable_getitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_setitem")]
  public static extern void StrTable_setitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_AddRange")]
  public static extern void StrTable_AddRange(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_GetRange")]
  public static extern global::System.IntPtr StrTable_GetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Insert")]
  public static extern void StrTable_Insert(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_InsertRange")]
  public static extern void StrTable_InsertRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_RemoveAt")]
  public static extern void StrTable_RemoveAt(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_RemoveRange")]
  public static extern void StrTable_RemoveRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Repeat")]
  public static extern global::System.IntPtr StrTable_Repeat(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Reverse__SWIG_0")]
  public static extern void StrTable_Reverse__SWIG_0(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_Reverse__SWIG_1")]
  public static extern void StrTable_Reverse__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTable_SetRange")]
  public static extern void StrTable_SetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_delete_StrTable")]
  public static extern void delete_StrTable(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Clear")]
  public static extern void StrTableCollection_Clear(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Add")]
  public static extern void StrTableCollection_Add(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_size")]
  public static extern uint StrTableCollection_size(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_capacity")]
  public static extern uint StrTableCollection_capacity(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_reserve")]
  public static extern void StrTableCollection_reserve(global::System.Runtime.InteropServices.HandleRef jarg1, uint jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTableCollection__SWIG_0")]
  public static extern global::System.IntPtr new_StrTableCollection__SWIG_0();

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTableCollection__SWIG_1")]
  public static extern global::System.IntPtr new_StrTableCollection__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_new_StrTableCollection__SWIG_2")]
  public static extern global::System.IntPtr new_StrTableCollection__SWIG_2(int jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_getitemcopy")]
  public static extern global::System.IntPtr StrTableCollection_getitemcopy(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_getitem")]
  public static extern global::System.IntPtr StrTableCollection_getitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_setitem")]
  public static extern void StrTableCollection_setitem(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_AddRange")]
  public static extern void StrTableCollection_AddRange(global::System.Runtime.InteropServices.HandleRef jarg1, global::System.Runtime.InteropServices.HandleRef jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_GetRange")]
  public static extern global::System.IntPtr StrTableCollection_GetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Insert")]
  public static extern void StrTableCollection_Insert(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_InsertRange")]
  public static extern void StrTableCollection_InsertRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_RemoveAt")]
  public static extern void StrTableCollection_RemoveAt(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_RemoveRange")]
  public static extern void StrTableCollection_RemoveRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Repeat")]
  public static extern global::System.IntPtr StrTableCollection_Repeat(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Reverse__SWIG_0")]
  public static extern void StrTableCollection_Reverse__SWIG_0(global::System.Runtime.InteropServices.HandleRef jarg1);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_Reverse__SWIG_1")]
  public static extern void StrTableCollection_Reverse__SWIG_1(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, int jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_StrTableCollection_SetRange")]
  public static extern void StrTableCollection_SetRange(global::System.Runtime.InteropServices.HandleRef jarg1, int jarg2, global::System.Runtime.InteropServices.HandleRef jarg3);

  [global::System.Runtime.InteropServices.DllImport("TreeizeRelD", EntryPoint="CSharp_delete_StrTableCollection")]
  public static extern void delete_StrTableCollection(global::System.Runtime.InteropServices.HandleRef jarg1);
}
