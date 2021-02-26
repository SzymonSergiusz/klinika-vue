module.exports = {
    css: {
        loaderOptions: {
            sass: {
                additionalData: '@import "@/styles/base.scss";'
            }
        }
    },
	configureWebpack: {
		watchOptions: {
			poll: false
        }
    },
}