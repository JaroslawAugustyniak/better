const path = require('path');
const webpack = require( 'webpack' );
module.exports = {
    entry: {
        index: ['./src/main.js','./src/styles/main.scss'],
    },
    
    output: {
        filename: 'js/main.min.js',
        path: path.resolve(__dirname, './../../../assets'),
        clean: true,
    },

    plugins: [
        new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            "window.jQuery": "jquery",
            Popper: ['popper.js', 'default'],
        }),
    ]
  };


  