var readfun = Module.findExportByName("libc.so", "read")
 Interceptor.attach(readfun, {
  onEnter: function (args, state) {
         console.log("[+] CALLED READ");
         console.log('read called:\n' +
        Thread.backtrace(this.context, Backtracer.ACCURATE)
        .map(DebugSymbol.fromAddress).join('\n') + '\n');
  },
  onLeave: function (retval) {
  }
 });
