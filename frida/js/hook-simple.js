var readfun = Module.findExportByName("libc.so", "read")
 Interceptor.attach(readfun, {
  onEnter: function (args, state) {
         console.log("[+] CALLED READ");
  },
  onLeave: function (retval) {
  }
 });
