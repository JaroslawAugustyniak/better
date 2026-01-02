const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = merge(common, {
   mode: 'production',
   devtool: 'source-map',
   optimization: {
    minimize: true
  },
   plugins: [
    new MiniCssExtractPlugin({
      // Options similar to the same options in webpackOptions.output
      // both options are optional
      filename: 'styles/main.min.css'
    })],
    
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
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']
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
                      name: 'images-css/[name].[ext]',
                      publicPath: '../',
                      useRelativePaths: true
                    },
                  },
                ],
              },
        ]
    },
});