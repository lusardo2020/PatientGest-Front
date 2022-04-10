
<template>
    <div>
        <MiHeader/>
            <div class="container ">
                <div class="container derecha">
                    <button class="btn btn-primary" v-on:click="nuevo()"> Nuevo Registro</button>
                    <br>
                </div>
                
                Listado de Pacientes Activos 
                <hr>
                <br>
            </div>


            <div class="container">
                <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Dni</th>
                    <th scope="col">Teléfono</th>
                     <th scope="col">Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="paciente in Listapacientes" :key="paciente.PacienteId" v-on:click="editar(paciente.PacienteId)">
                    <th scope="row">{{paciente.PacienteId}}</th>
                    <td>{{paciente.Nombre}}</td>
                    <td>{{paciente.DNI}}</td>
                    <td>{{paciente.Telefono}}</td>
                    <td>{{paciente.Correo}}</td>
                    </tr>                   
                </tbody>
                </table>

        </div>

        <MiFooter/>
    </div>
</template>

<script>
import MiHeader from '@/components/Header.vue';
import MiFooter from '@/components/Footer.vue';
import axios from 'axios'

export default {
    name: 'Dash-board',
    data(){
        return{
            Listapacientes:null,
            pagina:1
        }
    },
    components:{
        MiHeader,
        MiFooter
    },
    methods: {
        editar(id){
            this.$router.push('/editar/' + id);
        },
        nuevo(){
            this.$router.push('/nuevo'); 
        }
    },
    mounted: function(){
        let direccion = "https://api.solodata.es/pacientes?page=" + this.pagina;
        axios.get(direccion).then(data =>{
            console.log(data)
            this.Listapacientes = data.data;
        })
    }

}
</script>
<style  scoped>
.derecha{
    text-align: right;
}
</style>