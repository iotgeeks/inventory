import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MomentModule } from 'angular2-moment';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
// Material component library 
import { MdAutocompleteModule } from '@angular/material';
import { MdDatepickerModule, MdNativeDateModule } from '@angular/material';

import { AuthGuard } from './auth-guard.service';
import { HomeComponent } from '../pages/home/home.component';
import { LoginComponent } from '../pages/login/login.component';
import { SignupComponent } from '../pages/signup/signup.component';
import { PatientSignupComponent } from '../pages/patient-signup/patient-signup.component';
import { ProviderSignupComponent } from '../pages/provider-signup/provider-signup.component';

const routes: Routes = [
    { path: '', redirectTo: 'home', pathMatch: 'full'},
    { path: 'home', component: HomeComponent, canActivate: [AuthGuard]},
    { path: 'login', component: LoginComponent, canActivate: [AuthGuard]},
    { path: 'signup', component: SignupComponent, canActivate: [AuthGuard]},
    { path: 'patient-provider-signup/:type', component: PatientSignupComponent},
    { path: 'provider-signup', component: ProviderSignupComponent}

    // {path: 'second', component: SecondComponent, children: [
    //     {path: 'firstchildcomp', component: FirstchildComponent, outlet:'firstchild'},
    //     {path: 'secondchildcomp', component: SecondchildComponent, outlet:'secondchild'}
    // ]},
];
 
@NgModule({
    imports: [ BrowserModule, FormsModule,
        ReactiveFormsModule,
        //HttpModule,
        MaterialModule,
        MomentModule,
        BrowserAnimationsModule,
        MdAutocompleteModule,
        MdDatepickerModule,
        MdNativeDateModule,
        RouterModule.forRoot(routes)
    ],
    exports: [ 
        RouterModule
    ],
    declarations: [ HomeComponent,
        LoginComponent,
        LoginComponent,
        SignupComponent,
        PatientSignupComponent,
        ProviderSignupComponent
    ],
    providers: [AuthGuard]
})
 
export class RoutingModule {}