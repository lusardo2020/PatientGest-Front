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
                      <button type="button" class="btn btn-primary" v-on:click="editar()">Editar</button>
                      <button type="button" class="btn btn-danger margen" v-on:click="eliminar()">Eliminar</button>
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
    name: 'Mi-Editar',
    
    components:{
        MiHeader,
        MiFooter
    }, 
    data(){
        return{
            form: {
                "pacienteId": "",
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
    methods:{
        editar(){
            axios.put("https://api.solodata.es/pacientes",this.form)
            .then(data =>{
                console.log(data)
            })
        },
        salir(){
            this.$router.push('/dashboard');
        },
        //modificar apirest con headers para la eliminación de registros
        eliminar(){
            var enviar ={
                "pacienteId": this.form.pacienteId,
                "token": this.form.token
            };
            axios.delete("https://api.solodata.es/pacientes",{headers: enviar})
            .then(datos=>{
                console.log(datos);
                this.$router.push('/dashboard');
            })
        }
    },
    mounted: function(){
        this.form.pacienteId = this.$route.params.id;
       axios.get("https://api.solodata.es/pacientes?id=" + this.form.pacienteId)
       .then(datos =>{
           this.form.nombre = datos.data[0].Nombre;
           this.form.dni = datos.data[0].DNI;
           this.form.correo = datos.data[0].Correo;
           this.form.codigoPostal = datos.data[0].CodigoPostal;
           this.form.genero = datos.data[0].Genero;
           this.form.telefono = datos.data[0].Telefono;
           this.form.fechaNacimiento = datos.data[0].FechaNacimiento;
           this.form.token = localStorage.getItem("token");
           console.log(this.form)
       })
    }
}
</script>

<style scoped>
.left {
    text-align: left;
}
</style>