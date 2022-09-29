/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Productos AS Target 
USING (VALUES /* ProductoID (autonumérico), Nombre, Descripción, Stock */
      ('Doxycycline Hyclate','ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing',298),
      ('Risperidone','Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla.',563),
      ('Lisinopril','nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing',564),
      ('Celebrex','risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at,',439),
      ('Lorazepam','tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus',271),
      ('Lisinopril','et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus',288),
      ('Folic Acid','ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus',44),
      ('Tricor','ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam',805),
      ('Amitriptyline HCl','mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis.',568),
      ('Amphetamine Salts','nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.',680),
      ('APAP/Codeine','porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est,',441),
      ('Enalapril Maleate','at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi',390),
      ('Folic Acid','sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin',27),
      ('Ciprofloxacin HCl','vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus',583),
      ('Pantoprazole Sodium','nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,',742),
      ('Nasonex','euismod est arcu ac orci. Ut semper pretium neque. Morbi quis',827),
      ('Benicar','mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum',309),
      ('Lorazepam','Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu',886),
      ('Venlafaxine HCl ER','sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim',980),
      ('Tricor','erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis',861),
      ('Vyvanse','lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus.',140),
      ('Meloxicam','amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque',469),
      ('Premarin','tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor',618),
      ('Celebrex','dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin',960),
      ('Celebrex','nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh.',579),
      ('Ciprofloxacin HCl','a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi',181),
      ('Venlafaxine HCl ER','in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac',948),
      ('Zolpidem Tartrate','velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus',772),
      ('Fluticasone Propionate','Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer',89),
      ('Losartan Potassium','et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis',117),
      ('Trazodone HCl','mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,',969),
      ('Cyclobenzaprin HCl','aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque',200),
      ('TriNessa','Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae',174),
      ('Levothyroxine Sodium','Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor.',668),
      ('Famotidine','vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae,',313),
      ('Diazepam','ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu',298),
      ('Metformin HCl','tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras',959),
      ('Omeprazole (Rx)','mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis',191),
      ('Zolpidem Tartrate','lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi',389),
      ('Omeprazole (Rx)','elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies',658),
      ('TriNessa','elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam',868),
      ('Crestor','natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate',260),
      ('Meloxicam','iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque',518),
      ('Actos','metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames',773),
      ('Levothyroxine Sodium','vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis',102),
      ('Amitriptyline HCl','congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in',370),
      ('Famotidine','amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed',505),
      ('Nuvaring','Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris',964),
      ('Flovent HFA','Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis.',738),
      ('Risperidone','eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus.',720),
      ('Lidoderm','tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra',526),
      ('Hydrocodone/APAP','augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan',230),
      ('Glyburide','natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed',838),
      ('Spiriva Handihaler','magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor',883),
      ('Vyvanse','tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas',641),
      ('Flovent HFA','semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,',137),
      ('Lexapro','Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis',839),
      ('Crestor','sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum',99),
      ('Doxycycline Hyclate','sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat',679),
      ('Alendronate Sodium','ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut,',462),
      ('Prednisone','nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut',849),
      ('Clonazepam','ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac',172),
      ('Cephalexin','adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque',73),
      ('Metoprolol Tartrate','sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie',952),
      ('Fluoxetine HCl','mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed',400),
      ('Citalopram HBr','risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan',202),
      ('Crestor','Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',780),
      ('Vyvanse','tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque',375),
      ('Amlodipine Besylate','aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas',653),
      ('Amoxicillin Trihydrate/Potassium Clavulanate','ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta',121),
      ('Doxycycline Hyclate','magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla',484),
      ('Nexium','id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce',855),
      ('Cymbalta','facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet',791),
      ('Metformin HCl','ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus',784),
      ('Enalapril Maleate','dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam',375),
      ('Metoprolol Succinatee','ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',234),
      ('Amphetamine Salts','mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare',335),
      ('Gianvi','feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus',929),
      ('Tricor','pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi',209),
      ('Singulair','odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero',677),
      ('Lidoderm','quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim',950),
      ('Bystolic','Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',18),
      ('Cialis','Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,',183),
      ('Tricor','arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.',879),
      ('Sertraline HCl','Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas',391),
      ('Ranitidine HCl','libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi',952),
      ('Furosemide','nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non',757),
      ('Allopurinol','Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis',70),
      ('Triamcinolone Acetonide','a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut',902),
      ('Suboxone','vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit',326),
      ('Benicar HCT','rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros',535),
      ('Glyburide','nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer',764),
      ('Spiriva Handihaler','dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit',542),
      ('Nexium','nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed',740),
      ('Celebrex','euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus',444),
      ('Alendronate Sodium','facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis',94),
      ('Januvia','diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui',667),
      ('Vyvanse','bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.',92),
      ('Singulair','diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,',404),
      ('Doxycycline Hyclate','feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero',449)
)
AS Source (Nombre, Descripcion, Stock) 
ON Target.Nombre= Source.Nombre
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Nombre, Descripcion, Stock) 
VALUES (Nombre, Descripcion, Stock);

MERGE INTO Usuarios AS Target
USING (VALUES 
        ('Usuario1', 'Usuario1', 'usu01', 'usu01'), 
        ('Usuario2', 'Usuario2', 'usu02', 'usu02'), 
        ('Usuario3', 'Usuario3', 'usu03', 'usu03'), 
        ('Usuario4', 'Usuario4', 'usu04', 'usu04')
)
AS Source (Nombre, Apellidos, Login, Password)
ON Target.Login = Source.Login
WHEN NOT MATCHED BY TARGET THEN
INSERT (Nombre, Apellidos, Login, Password)
VALUES (Nombre, Apellidos, Login, Password);