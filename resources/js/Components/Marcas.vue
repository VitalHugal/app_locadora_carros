<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <!-- inicio card de busca -->
                <div class="card mb-3">
                    <div class="card-header">Busca de marcas</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input-container titulo="ID" id="inputId" id-help="idHelp"
                                    texto-ajuda="Opcional. Inofrme o ID da marca.">
                                    <input type="number" class="form-control" id="inputId" aria-describedby="idHelp"
                                        placeholder="ID">
                                </input-container>
                            </div>
                            <div class="col-md-6 mb-3">
                                <input-container titulo="Nome da marca" id="inputNome" id-help="NomeHelp"
                                    texto-ajuda="Opcional. Inofrme o nome da marca.">
                                    <input type="text" class="form-control" id="inputNome" aria-describedby="nomeHelp"
                                        placeholder="Nome da marca">
                                </input-container>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary btn-sm">Pesquisar</button>
                    </div>
                </div>
                <!-- fim card de busca -->

                <!-- inicio do card listagem de marcas -->
                <div class="card">
                    <div class="card-header">Relação de marcas</div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="card-footer d-flex justify-content-end">
                        <button type="button" class="btn btn-primary btn-sm">Adicionar</button>
                    </div>
                </div>
                <!-- fim do card listagem de marcas -->
            </div>
        </div>
    </div>
</template>

<script>

</script>
