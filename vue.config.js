const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  css: {
    extract: false, // 不分离 CSS
  },
  configureWebpack: config => {
    if (process.env.NODE_ENV === 'production') {
      const componentName = process.env.npm_config_name || 'MyComponent';
      config.output = {
        ...config.output,
        filename: `${componentName}.js`, // 输出的文件名与组件名相同
        library: componentName, // 库名称与组件名一致
        libraryExport: 'default',
        libraryTarget: 'umd',
      };
    }
  },
  chainWebpack: config => {
    if (process.env.NODE_ENV === 'production') {
      // 禁用代码拆分
      config.optimization.delete('splitChunks');
      // 删除多余插件
      config.plugins.delete('html'); // 不生成 HTML 文件
      config.plugins.delete('preload');
      config.plugins.delete('prefetch');
    }
  },
  devServer: {
    allowedHosts: 'all', // 禁用主机检查
  },
})
