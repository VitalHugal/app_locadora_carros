<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Busca de marcas</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input-container titulo="ID" id="inputId" id-help="idHelp" texto-ajuda="Opcional. Inofrme o ID da marca.">
                                    <input type="number" class="form-control" id="inputId" aria-describedby="idHelp"placeholder="ID">
                                </input-container>
                            </div>
                            <div class="col-md-6 mb-3">
                                <input-container titulo="Nome da marca" id="inputNome" id-help="NomeHelp" texto-ajuda="Opcional. Inofrme o nome da marca.">
                                <input type="text" class="form-control" id="inputNome" aria-describedby="nomeHelp"placeholder="Nome da marca">
                                </input-container>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary btn-sm">Pesquisar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

</script>
