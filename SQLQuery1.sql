    --create database VigiliUrbani; 

	
create table Vigile(
Matricola int Identity(1,1) primary key,
Nome nvarchar(30) not null,
Cognome nvarchar(30) not null,

);

 create table Veicolo (
 TargaVeicolo nchar(6) primary key
 );


create table Contravvenzione(
NumeroVerbale int Identity(1000,1) constraint PK_Film primary key,
Luogo nvarchar(50) not null,
DataVerbale datetime not null,
MatricolaVigile int not null, 
TargaVeicolo nchar(6) not null,
constraint FK_Vigile Foreign key (MatricolaVigile) references Vigile(Matricola)
);
   
alter table Contravvenzione add constraint FK_Veicolo Foreign key (TargaVeicolo) references Veicolo(TargaVeicolo)




create table Automobile(
TargaAuto nchar(6) constraint PK_targaAuto primary key,
Potenza int not null, 

constraint FK_Auto Foreign key (TargaAuto) references Veicolo(TargaVeicolo)
);
 
create table Moto(
TargaMoto nchar(6) constraint PK_targaMoto primary key,
CodiceTelaio nvarchar(20) not null,  

constraint FK_Moto Foreign key (TargaMoto) references Veicolo(TargaVeicolo)
);