# News



# Getting Jquery and Bootstrap Up

## Install Yarn

add repository from yarn install webpage
apt-get update && apt-get install yarn

## Install bootstrap jquery and popper.js

yarn add boostrap jquery popper.js

## Add boostrap to application.scss

@import "bootstrap/scss/bootstrap";

## config/webpack/environment.js

const { environment } = require('@rails/webpacker')

module.exports = environment


import { environment } from '@rails/webpacker'

import { ProvidePlugin } from 'webpack'
environment.plugins.append('Provide', 
	new ProvidePlugin({
		s: 'jquery',
		jQuery: 'jquery',
		Popper: ['popper.js', 'default']
	}))

export default environment


## Add requires for custom js to javascript/packs/application.js

require("channels")
require("packs/main.js")
