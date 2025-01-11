import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trecker_sample/Homescreen/bloc/chat_bloc.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final TextEditingController controller = TextEditingController();
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Danny Hopkins"),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/5642755/pexels-photo-5642755.jpeg?auto=compress&cs=tinysrgb&w=600"),
          ),
        ),
        actions: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: [
            SizedBox(
              height: 50,
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if(state is Tapper){
                  return Expanded(
                  child: ListView.builder(
                    
                    
                    itemCount: state.ontap.length,
                      itemBuilder: (context, index) => 
                        
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(state.ontap[index]),
                                  ),
                                ),
                          ),
                              
                         
                      ),
                );
                }
                return SizedBox();
              },
              
            ),
            
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  label: Text("message"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  
                  suffix: IconButton(onPressed: () {
                    var message=controller.text.toString();
                    
                     
                      context.read<ChatBloc>().add(Ontaper(message: message));
                      controller.clear();
                    
                      
                    
                  }, icon: Icon(Icons.send)),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  prefixIcon:Icon(Icons.camera_alt_outlined) ,
                  
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        
                        width: 1,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                    
                      width: 1
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
