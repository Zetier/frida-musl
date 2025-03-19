const f = Module.getExportByName('libc.so','open');
Interceptor.attach(f, {
  onEnter(args) {
    console.log('open called from:\n' +
        Thread.backtrace(this.context, Backtracer.ACCURATE)
        .map(DebugSymbol.fromAddress).join('\n') + '\n');
  }
});