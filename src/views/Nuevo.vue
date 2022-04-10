<template>
    <div>
        <MiHeader/>
            <div class="container">
            
            <form action="" class="form-horizontal">
                    <div class="form-group left">
                       <label for="" class="control-label col-sm-2">Nombre</label>
                       <div class="col-sm-10">
                          <input type="text" class="form-control" name="nombre" id="nombre" v-model="form.nombre">
                       </div>
                    </div>
                    <div class="form-group left row">
                      <div class="col">
                            <label for="" class="control-label col-sm-3">Correo</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="correo" id="correo" v-model="form.correo">
                            </div>
                        </div>
                        <div class="col">
                          <label for="" class="control-label col-sm-5">Código Postal</label>
                          <div class="col-sm-8">
                              <input type="text" class="form-control" name="codigopostal" id="codigopostal" v-model="form.codigoPostal">
                          </div>
                        </div> 
                    </div>
                    <div class="form-group left row">
                         <div class="col">
                            <label for="" class="control-label col-sm-2">Género</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="genero" id="genero" v-model="form.genero">
                            </div>
                          </div>
                         <div class="col">
                              <label for="" class="control-label col-sm-2">Teléfono</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" name="telefono" id="telefono" v-model="form.telefono">
                              </div>
                        </div>
                    </div>
                    <div class="form-group left row">
                        <div class="col">
                            <label for="" class="control-label col-sm-3">Fecha Nac</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="fechanacimineto" id="telefono" v-model="form.fechaNacimiento">
                    </div>
                    </div> 
                    <div class="col">
                        <label for="" class="control-label col-sm-3">DNI</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="dni" id="dni" v-model="form.dni">
                            </div>
                    </div> 
                    </div>   
                    <hr><br>     
                   
                   <div class="form-group ">
                      <button type="button" class="btn btn-primary" v-on:click="guardar()">Guardar</button>
                      <button type="button" class="btn btn-dark margen" v-on:click="salir()">Salir</button>
                    </div> 

            </form>
            
             </div>
        <MiFooter/>
   
    </div>
</template>

<script>
import MiHeader from '@/components/Header.vue';
import MiFooter from '@/components/Footer.vue';
import axios from 'axios';

export default {
    name: 'Mi-Nuevo',
    data(){
        return{
            form: {
                "nombre" : "",
                "dni" : "", 
                "correo":"",
                "codigoPostal" :"",
                "genero" : "",
                "telefono" : "",
                "fechaNacimiento" : "",
                "token" : ""      
            }
        }
    },
    components:{
        MiHeader,
        MiFooter
    },
    methods:{
        guardar(){
            this.form.token = localStorage.getItem("token");
            axios.post("https://api.solodata.es/pacientes",this.form)
            .then(data =>{
                console.log(data);
                this.makeToast("Hecho","Paciente creado","success");
                this.$router.push('/dashboard');
            })
           
        },
        salir(){
            this.$router.push('/dashboard');
        },
        makeToast(titulo,texto,tipo) {
            this.toastCount++
            this.$bvToast.toast(texto, {
            title: titulo,
            variant: tipo,
            autoHideDelay: 10000,
            appendToast: true
            }).catch( e =>{
                console.log(e);
                 this.makeToast("Error","Error al guardar","error");
            })
        }
        
    
    }
    
}
</script>

<style scoped>
    .left{
        text-align: left;
    }
</style>