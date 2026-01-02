const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
    mode: 'development',
    devtool: 'inline-source-map',
    devServer: {
        contentBase: '../../assets',
        // disableHostCheck: true,
        host: "new.better.localhost",
        hot: true,
        headers: {
          'Access-Control-Allow-Origin': '*'
        }
      },
    resolve: {
        extensions: ['.scss',".ts", ".js", "json"],
        modules: ["src", "node_modules"],
    },
    
    module: {
        rules: [
            
            {
                test: /\.css$/,
                use: ["style-loader","css-loader"]
            },
            {
                test: /\.less$/,
                use: [ 'css-loader', 'less-loader']
            },
            {
              test: /\.scss$/,
              use: [ 'style-loader','css-loader', 'sass-loader']
            },
            {
                test: /\.(png|jpg|gif)$/,
                loader: 'file-loader',
                options: {
                  name: 'images/[name].[ext]'
                }
            },
            {
                test: /\.(woff|ttf|eot|woff2|woff)$/,
                loader: 'file-loader',
                options: {
                  name: 'fonts/[name].[ext]'
                }
            },
            {
              test: /\.svg$/,
              use: [
                {
                  loader: 'svg-url-loader',
                  options: {
                    limit: 10000,
                  },
                },
              ],
            },
        ]
    },
    
});