<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- inicio card de busca modelos -->
                <card-component titulo="Busca de modelos">
                    <template v-slot:conteudo>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="ID" id="inputIdModelo" id-help="idHelpModelo"
                                    texto-ajuda="Opcional. Inofrme o ID do modelo.">
                                    <input type="number" class="form-control" id="inputIdModelo" aria-describedby="idHelpModelo"
                                        placeholder="ID" v-model="busca.id">
                                </input-container>
                                <!-- {{ nomeMarca }} -->
                            </div>
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="Nome do modelo" id="inputNomeModelo" id-help="NomeHelpModelo"
                                    texto-ajuda="Opcional. Inofrme o nome do modelo.">
                                    <input type="text" class="form-control" id="inputNomeModelo" aria-describedby="nomeHelpModelo"
                                        placeholder="Nome do modelo" v-model="busca.nome">
                                </input-container>
                                <!-- {{ arquivoImagem }} -->
                            </div>
                        </div>
                    </template>

                    <template v-slot:rodape>
                        <button type="submit" class="btn btn-primary btn-sm" @click="pesquisar()">Pesquisar</button>
                    </template>
                </card-component>
                <!-- fim card de busca -->

                <!-- inicio do card listagem de modelos -->
                <card-component titulo="Relação de modelo">
                    <template v-slot:conteudo>
                        <!-- Componente que instaciamos -->
                        <table-component :dados="modelos.data"
                            :visualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalModeloVisualizar' }"
                            :atualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalModeloAtualizar' }"
                            :remover="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalModeloRemover' }"
                            :titulos="{
                                id: { titulo: 'ID', tipo: 'text' },
                                marca_id: { titulo: 'Marca ID', tipo: 'text' },
                                nome: { titulo: 'Nome', tipo: 'text' },
                                imagem: { titulo: 'Imagem', tipo: 'imagem' },
                                numero_portas: { titulo: 'Número de portas', tipo: 'text' },
                                lugares: { titulo: 'Lugares', tipo: 'text' },
                                air_bag: { titulo: 'Air-Bag', tipo: 'text' },
                                abs: { titulo: 'ABS', tipo: 'text' },
                                created_at: { titulo: 'Data de criação', tipo: 'data' },
                            }"></table-component>
                    </template>
                    <template v-slot:rodape>
                        <div class="col">
                            <div class="col-10">
                                <paginate-component>
                                    <li v-for="l, key in modelos.links" :key="key"
                                        :class="l.active ? 'page-item active' : 'page-item'" @click="paginacao(l)">
                                        <a class="page-link" v-html="l.label"></a>
                                    </li>
                                </paginate-component>
                            </div>
                            <div class="col ">
                                <button type="button" class="btn btn-primary btn-sm " data-bs-toggle="modal"
                                    data-bs-target="#modalModelo">Adicionar</button>
                            </div>
                        </div>
                    </template>
                </card-component>
                <!-- fim do card listagem de Modelo -->
            </div>
        </div>

        <!-- inicio do modal de inclusão de Modelo -->
        <modal-component id="modalModelo" titulo="Adicionar modelo">

            <template v-slot:alertas>
                <alert-component tipo="success" :detalhes="transacaoDetalhes" titulo="Cadastro realizado com sucesso"
                    v-if="transacaoStatus == 'adicionado'"></alert-component>
                <alert-component tipo="danger" :detalhes="transacaoDetalhes" titulo="Erro ao tentar cadastrar um novo modelo"
                    v-if="transacaoStatus == 'erro'"></alert-component>
            </template>

            <template v-slot:conteudo>
                <div class="form-group">
                    <input-container titulo="Marca ID" id="novoMarcaIDModelo" id-help="novoMarcaIDHelpModelo"
                        texto-ajuda="Informe o id da marca.">
                        <input type="text" class="form-control" id="novoMarcaIDModelo" aria-describedby="novoMarcaIDHelpModelo"
                            placeholder="Marca ID" v-model="marca_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Nome do modelo" id="novoNomeModelo" id-help="novoNomeHelpModelo"
                        texto-ajuda="Informe o nome do modelo.">
                        <input type="text" class="form-control" id="novoNomeModelo" aria-describedby="novoNomeHelpModelo"
                            placeholder="Nome do modelo" v-model="nomeModelo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Imagem" id="novoImagemModelo" id-help="novoImagemHelpModelo"
                        texto-ajuda="Selecione uma imagem no formato PNG.">
                        <input type="file" class="form-control" id="novoImagemModelo" aria-describedby="novoImagemHelpModelo"
                            placeholder="Selecione uma imagem" @change="carregarImagem($event)">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Número de portas" id="novoNumeroPortasModelo" id-help="novoNumeroPortasHelpModelo"
                        texto-ajuda="Informe o número de portas que o carro tem (1 - 5).">
                        <input type="text" class="form-control" id="novoNumeroPortasModelo" aria-describedby="novoNumeroPortasHelpModelo"
                            placeholder="Número de portas" v-model="numero_portas">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Lugares" id="novoLugaresModelo" id-help="novoLugaresHelpModelo"
                        texto-ajuda="Informe quantos lugares o carro tem (1 - 20).">
                        <input type="text" class="form-control" id="novoLugaresModelo" aria-describedby="novoLugaresHelpModelo"
                            placeholder="Lugares" v-model="lugares">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Air-Bag" id="novoAirBagModelo" id-help="novoAirBagHelpModelo"
                        texto-ajuda="Informe se o carro possui air-bag (1 = Sim | 0 = Não)">
                        <input type="text" class="form-control" id="novoAirBagModelo" aria-describedby="novoAirBagHelpModelo"
                            placeholder="Air-bag" v-model="air_bag">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="ABS" id="novoABSModelo" id-help="novoABSHelpModelo"
                        texto-ajuda="Informe se o carro possui freio ABS (1 = Sim | 0 = Não)">
                        <input type="text" class="form-control" id="novoABSModelo" aria-describedby="novoABSHelpModelo"
                            placeholder="ABS" v-model="abs">
                    </input-container>
                </div>
            </template>

            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="salvar()">Salvar</button>
            </template>
        </modal-component>
        <!-- fim do modal de inclusão de modelo -->

        <!-- inicio do modal de visualização de modelo -->
        <modal-component id="modalModeloVisualizar" titulo="Visualizar modelo">
            <template v-slot:alertas>
            </template>
            <template v-slot:conteudo>
                <input-container titulo="ID">
                    <input type="text" class="form-control" :value="$store.state.item.id" disabled>
                </input-container>
                <input-container titulo="Marca ID">
                    <input type="text" class="form-control" :value="$store.state.item.marca_id" disabled>
                </input-container>
                <input-container titulo="Nome do modelo">
                    <input type="text" class="form-control" :value="$store.state.item.nome" disabled>
                </input-container>
                <input-container titulo="Imagem">
                    <img :src="'storage/' + $store.state.item.imagem" v-if="$store.state.item.imagem">
                </input-container>
                <input-container titulo="Número de portas">
                    <input type="text" class="form-control" :value="$store.state.item.numero_portas" disabled>
                </input-container>
                <input-container titulo="Lugares">
                    <input type="text" class="form-control" :value="$store.state.item.lugares" disabled>
                </input-container>
                <input-container titulo="Air-bag">
                    <input type="text" class="form-control" :value="$store.state.item.air_bag" disabled>
                </input-container>
                <input-container titulo="ABS">
                    <input type="text" class="form-control" :value="$store.state.item.abs" disabled>
                </input-container>
                <input-container titulo="Data de criação">
                    <input type="text" class="form-control" :value="$store.state.item.created_at" disabled>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </template>
        </modal-component>
        <!-- fim do modal de visualização de marca -->

        <!-- inicio do modal de remoção de marca -->
        <modal-component id="modalModeloRemover" titulo="Remover marca">
            <template v-slot:alertas>
                <alert-component tipo="success" titulo="Transação realizada com sucesso."
                    :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'sucesso'">
                </alert-component>
                <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'erro'">
                </alert-component>
            </template>
            <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
                <input-container titulo="ID">
                    <input type="text" class="form-control" :value="$store.state.item.id" disabled>
                </input-container>
                <input-container titulo="Marca ID">
                    <input type="text" class="form-control" :value="$store.state.item.marca_id" disabled>
                </input-container>
                <input-container titulo="Nome do modelo">
                    <input type="text" class="form-control" :value="$store.state.item.nome" disabled>
                </input-container>
                <input-container titulo="Data de criação">
                    <input type="text" class="form-control" :value="$store.state.item.created_at" disabled>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-danger" @click="remover()"
                    v-if="$store.state.transacao.status != 'sucesso'">Remover</button>
            </template>
        </modal-component>
        <!-- fim do modal de remoção de marca -->

        <!-- inicio do modal de atualização de marca -->
        <modal-component id="modalModeloAtualizar" titulo="Atualizar modelo">
            <template v-slot:alertas>
                <alert-component tipo="success" titulo="Transação realizada com sucesso."
                    :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'sucesso'">
                </alert-component>
                <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'erro'">
                </alert-component>
            </template>
            <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
                <div class="form-group">
                    <input-container titulo="Marca ID" id="atualizarMarcaIDModelo" id-help="atualizarMarcaIDModeloHelp"
                        texto-ajuda="Informe o id da marca.">
                        <input type="text" class="form-control" id="atualizarMarcaIDModelo" aria-describedby="atualizarMarcaIDModeloHelp"
                            placeholder="Marca ID" v-model="$store.state.item.marca_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Nome do Modelo" id="atualizarNomeModelo" id-help="atualizarNomeModeloHelp"
                        texto-ajuda="Informe o nome da marca">
                        <input type="text" class="form-control" id="atualizarNomeModelo" aria-describedby="atualizarNomeModeloHelp"
                            placeholder="Nome do modelo" v-model="$store.state.item.nome">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Imagem" id="atualizarImagemModelo" id-help="atualizarImagemModeloHelp"
                        texto-ajuda="Selecione uma imagem no formato PNG">
                        <input type="file" class="form-control" id="atualizarImagemModelo"
                            aria-describedby="atualizarImagemHelp" placeholder="Selecione uma imagem"
                            @change="carregarImagem($event)">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Número de portas" id="atualizarNumeroPortasModelo" id-help="atualizarNumeroPortasHelpModelo"
                        texto-ajuda="Informe o número de portas que o carro tem (1 - 5).">
                        <input type="text" class="form-control" id="novoNumeroPortasModelo" aria-describedby="novoNumeroPortasHelpModelo"
                            placeholder="Número de portas" v-model="numero_portas">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Lugares" id="atualizarLugaresModelo" id-help="atualizarLugaresHelpModelo"
                        texto-ajuda="Informe quantos lugares o carro tem (1 - 20).">
                        <input type="text" class="form-control" id="atualizarLugaresModelo" aria-describedby="atualizarLugaresHelpModelo"
                            placeholder="Lugares" v-model="lugares">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Air-Bag" id="atualizarAirBagModelo" id-help="atualizarAirBagHelpModelo"
                        texto-ajuda="Informe se o carro possui air-bag (1 = Sim | 0 = Não)">
                        <input type="text" class="form-control" id="atualizarAirBagModelo" aria-describedby="atualizarAirBagHelpModelo"
                            placeholder="Air-bag" v-model="air_bag">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="ABS" id="atualizarABSModelo" id-help="atualizarABSHelpModelo"
                        texto-ajuda="Informe se o carro possui freio ABS (1 = Sim | 0 = Não)">
                        <input type="text" class="form-control" id="atualizarABSModelo" aria-describedby="atualizarABSHelpModelo"
                            placeholder="ABS" v-model="abs">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="atualizar()">Atualizar</button>
            </template>
        </modal-component>
        <!-- fim do modal de atualização de marca -->


    </div>
</template>

<script>
import axios from 'axios'


export default {
    data() {
        return {
            urlBase: 'http://localhost:8000/api/v1/modelo',
            urlPaginacao: '',
            urlFiltro: '',
            marca_id: '',
            nomeModelo: '',
            arquivoImagem: [],
            numero_portas: '',
            lugares: '',
            air_bag: '',
            abs: '',
            transacaoStatus: '',
            transacaoDetalhes: {},
            modelos: { data: [] },
            busca: { id: '', nome: '' },
        }
    },
    methods: {
        atualizar() {

            let formData = new FormData();
            formData.append('_method', 'patch')
            formData.append('marca_id', this.$store.state.item.marca_id)
            formData.append('nome', this.$store.state.item.nome)
            formData.append('numero_portas', this.$store.state.item.numero_portas)
            formData.append('lugares', this.$store.state.item.lugares)
            formData.append('air_bag', this.$store.state.item.air_bag)
            formData.append('abs', this.$store.state.item.abs)
            if (this.arquivoImagem[0]) {
                formData.append('imagem', this.arquivoImagem[0])
            }


            let url = this.urlBase + '/' + this.$store.state.item.id

            let config = {
                headers: {
                    'Content-Type': 'multipart/form-data',
                }
            }

            axios.post(url, formData, config)
                .then(response => {
                    this.$store.state.transacao.status = 'sucesso'
                    this.$store.state.transacao.mensagem = 'Registro de marca atualizado com sucesso'
                    atualizarImagem.value = ''
                    this.carregarLista()
                })
                .catch(errors => {
                    this.$store.state.transacao.status = 'erro'
                    this.$store.state.transacao.mensagem = errors.response.data.message
                    this.$store.state.transacao.dados = errors.response.data.errors
                })
        },
        remover() {
            let confirmacao = confirm('Tem certeza que deseja remover esse registro?')

            if (!confirmacao) {
                return false;
            }

            let formData = new FormData();
            formData.append('_method', 'delete')

            // let config = {
            //     headers: {
            //         'Accept': 'application/json',
            //         'Authorization': this.token
            //     }
            // }

            let url = this.urlBase + '/' + this.$store.state.item.id

            console.log(this.$store.state.transacao)
            axios.post(url, formData )
                .then(response => {
                    this.$store.state.transacao.status = 'sucesso'
                    this.$store.state.transacao.mensagem = response.data.msg
                    this.carregarLista()
                })
                .catch(errors => {
                    this.$store.state.transacao.status = 'erro'
                    this.$store.state.transacao.mensagem = errors.response.data.erro

                })

        },
        pesquisar() {
            //console.log(this.busca)

            let filtro = ''

            for (let chave in this.busca) {

                if (this.busca[chave]) {
                    //console.log(chave, this.busca[chave])
                    if (filtro != '') {
                        filtro += ";"
                    }

                    filtro += chave + ':like:' + this.busca[chave]
                }
            }
            if (filtro != '') {
                this.urlPaginacao = 'page=1'
                this.urlFiltro = '&filtro=' + filtro
            } else {
                this.urlFiltro = ''
            }

            this.carregarLista()
        },
        paginacao(l) {
            if (l.url) {
                //this.urlBase = l.url //ajustando a url de consulta com o parâmetro de página
                this.urlPaginacao = l.url.split('?')[1]
                this.carregarLista() //requisitando novamente os dados para nossa API
            }
        },
        carregarLista() {
            let url = this.urlBase + '?' + this.urlPaginacao + this.urlFiltro

            console.log(url)
            axios.get(url)
                .then(response => {
                    this.modelos = response.data
                    //console.log(this.marcas)
                })
                .catch(errors => {
                    console.log(errors)
                })
        },
        carregarImagem(e) {
            this.arquivoImagem = e.target.files
        },
        salvar() {
            console.log(this.nomeModelo, this.arquivoImagem[0], this.marca_id, this.numero_portas, this.lugares, this.air_bag, this.abs)

            let formData = new FormData();
            formData.append('nome', this.nomeModelo)
            formData.append('imagem', this.arquivoImagem[0])
            formData.append('marca_id', this.marca_id)
            formData.append('numero_portas', this.numero_portas)
            formData.append('lugares', this.lugares)
            formData.append('air_bag', this.air_bag)
            formData.append('abs', this.abs)

            let config = {
                headers: {
                    'Content-Type': 'multipart/form-data',
                }
            }

            axios.post(this.urlBase, formData, config)
                .then(response => {
                    this.transacaoStatus = 'adicionado'
                    this.transacaoDetalhes = {
                        mensagem: 'ID do registro: ' + response.data.id
                    }

                    console.log(response)
                })
                .catch(errors => {
                    this.transacaoStatus = 'erro'
                    this.transacaoDetalhes = {
                        mensagem: errors.response.data.message,
                        dados: errors.response.data.errors
                    }
                    //errors.response.data.message
                })
        }
    },
    mounted() {
        this.carregarLista()
    }
}
</script>
