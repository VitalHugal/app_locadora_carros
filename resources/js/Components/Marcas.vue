<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- inicio card de busca -->
                <card-component titulo="Busca de marcas">
                    <template v-slot:conteudo>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="ID" id="inputId" id-help="idHelp"
                                    texto-ajuda="Opcional. Inofrme o ID da marca.">
                                    <input type="number" class="form-control" id="inputId" aria-describedby="idHelp"
                                        placeholder="ID">
                                </input-container>
                                <!-- {{ nomeMarca }} -->
                            </div>
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="Nome da marca" id="inputNome" id-help="NomeHelp"
                                    texto-ajuda="Opcional. Inofrme o nome da marca.">
                                    <input type="text" class="form-control" id="inputNome" aria-describedby="nomeHelp"
                                        placeholder="Nome da marca">
                                </input-container>
                                <!-- {{ arquivoImagem }} -->
                            </div>
                        </div>
                    </template>

                    <template v-slot:rodape>
                        <button type="submit" class="btn btn-primary btn-sm">Pesquisar</button>
                    </template>
                </card-component>
                <!-- fim card de busca -->

                <!-- inicio do card listagem de marcas -->
                <card-component titulo="Relação de marcas">
                    <template v-slot:conteudo>
                        <!-- Componente que instaciamos -->
                        <table-component></table-component>
                    </template>
                    <template v-slot:rodape>
                        <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#modalMarca">Adicionar</button>
                    </template>
                </card-component>
                <!-- fim do card listagem de marcas -->
            </div>
        </div>
        <modal-component id="modalMarca" titulo="Adicionar marca">

            <template v-slot:alertas>
                <alert-component tipo="success" v-if="transacaoStatus == 'Adicionado' "></alert-component>
                <alert-component tipo="danger" :detalhes="transacaoDetalhes" titulo="Erro ao tentar cadastrar a marca" v-if="transacaoStatus == 'Erro'"></alert-component>
            </template>

            <template v-slot:conteudo>
                <div class="form-group">
                    <input-container titulo="Nome da marca" id="novoNome" id-help="novoNomeHelp"
                        texto-ajuda="Inform o nome da marca.">
                        <input type="text" class="form-control" id="novoNome" aria-describedby="novoNomeHelp"
                            placeholder="Nome da marca" v-model="nomeMarca">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Imagem" id="novoImagem" id-help="novoImagemHelp"
                        texto-ajuda="Selecione uma imagem no formato png.">
                        <input type="file" class="form-control" id="novoImagem" aria-describedby="novoImagemHelp"
                            placeholder="Selecione uma imagem" @change="carregarImagem($event)">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="salvar()">Salvar</button>
            </template>
        </modal-component>
    </div>
</template>

<script>
import axios from 'axios'
import { computed } from 'vue'

export default {
    computed: {
    token() {
        let token = document.cookie.split(';').find(indice => {
            return indice.includes('token=');
        });
        token = token.split('=')[1];
        token = 'Bearer ' + token; // Adiciona um espaço após 'Bearer'
        return token;
    }
},

    data() {
        return {
            urlBase: 'http://localhost:8000/api/v1/marca',
            nomeMarca: '',
            arquivoImagem: [],
            transacaoStatus:'',
            transacaoDetalhes:[],
        }
    },
    methods: {

        carregarImagem(e) {
            this.arquivoImagem = e.target.files
        },
        salvar() {
            console.log(this.nomeMarca, this.arquivoImagem[0])

            let formData = new FormData();
            formData.append('nome', this.nomeMarca,)
            formData.append('imagem', this.arquivoImagem[0])

            let config = {
                headers: {
                    'Content-Type': 'multipart/form-data', //Assim como no postman aqui estamos estancionando os parametros para recebermos imagem e returnar arquivos json 
                    'Accept': 'application/josn',
                    'Authorization': this.token
                }
            }

            axios.post(this.urlBase, formData, config)// Atráves do axios estamos passando  parametros para as requisições http e api
                .then(response => {
                    this.transacaoStatus = 'Adicionado'
                    console.log(response)
                })
                .catch(errors => {
                    this.transacaoStatus = 'Erro'
                    this.transacaoDetalhes = errors.response
                    //console.log(errors.response.data.message)
                })
        }
    }

}
</script>
