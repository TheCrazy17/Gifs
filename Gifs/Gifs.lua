--// Creador: TheCrazy17
--// Fecha: 5/01/2020
--// Proposito: Funcionamiento general de la libreria de Gifs vía HTML

Gifs = {}
sX, sY = guiGetScreenSize()

function createGif(Patch, X, Y, W, H, Relative)
	-- Revisa que las variables requeridas se hayan entregado correctamente
	assert(type(Patch) == "string", "Mal argumento @ Gifs")
	assert(type(X) == "number", "Mal argumento @ Gifs")
	assert(type(Y) == "number", "Mal argumento @ Gifs")
	assert(type(W) == "number", "Mal argumento @ Gifs")
	assert(type(H) == "number", "Mal argumento @ Gifs")

	-- // Crea un navegador local
	self = guiCreateBrowser(0, 0, sX, sY, true, true, Relative or false)

	-- // Al finalizar de crear el navegador, carga el HTML
	addEventHandler("onClientBrowserCreated", self, function()
		loadBrowserURL(source, "http://mta/Gifs/index.html")
	end)

	-- // Al finalizar la carga del HTML, se ejecuta Javascript
	addEventHandler ( "onClientBrowserDocumentReady" , self, function()
		-- // En caso de ser relativo, se transforma la posición
		if Relative then
			X = sX*X
			Y = sY*Y
			W = sX*W
			H = sY*H
		end

		-- // Javascript
		executeBrowserJavascript(source, "var Gif = document.getElementById('myGif'); Gif.src='http://mta/"..string.gsub(Patch, ":/", "").."'; Gif.style.position = 'absolute'; Gif.style.left = '"..X.."px'; Gif.style.top = '"..Y.."px'; Gif.style.width = '"..W.."px'; Gif.style.height = '"..H.."px';");
	end)

	-- // Devuelve el navegador como si fuera un gif
	return self
end