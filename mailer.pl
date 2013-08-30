#!/usr/bin/perl
if ($ENV{'REQUEST_METHOD'} eq 'GET'){
print "Content-type:text/html\n\n";
print "Sorry, no GET methods allowed";exit(); }
if ($ENV{'QUERY_STRING'}){
print "Content-type: text/html\n\n";
print "Sorry, no query strings allowed";exit(); }
@referers=("www.mohlsen.com","mohlsen.com"); 
$check_referer = 0;
if ($ENV{'HTTP_REFERER'}) { 
foreach $referer (@referers) {
if ($ENV{'HTTP_REFERER'} =~ m|http?://([^/]*)$referer|i) {
$check_referer = 1; 
last;}}} else{ 
$check_referer = 1;}
if ($check_referer != 1){ 
print "Content-type: text/html\n\n";
print "<p><b><font size=\"4\" face=\"Arial\">You are not authorized to use this script from $ENV{'HTTP_REFERER'}\n";exit();}
if ($ENV{'REQUEST_METHOD'} eq 'POST'){
read(STDIN, $buffer,$ENV{'CONTENT_LENGTH'});
@pairs = split(/&/, $buffer);}
local($name, $value);
foreach $pair (@pairs){
($name, $value) = split(/=/, $pair);
$name =~ tr/+/ /;
$name =~ tr/+/ /;
$name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$value =~ tr/+/ /;
$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$value =~ s/<!--(.|
)*-->//g;
$gForm{$name} = $value;}
$sj="Mail from Web Page";
if ($gForm{'S1'} ne ""){
$sj=$gForm{'S1'};}
$fm="wedding\@mohlsen.com";
if ($gForm{'email'} ne ""){
$fm=$gForm{'email'};}
if ($gForm{'Email'} ne ""){
$fm=$gForm{'Email'};}
open(MAIL, "|/usr/lib/sendmail -t");
print MAIL "To: wedding\@mohlsen.com, ohlsen_wedding\@yahoo.com\n";
print MAIL "From: $fm\n";
print MAIL "Subject: $sj\n";
print MAIL "--------------------------------------------------\n";
@pairs = split(/&/, $buffer);
local($name, $value);
foreach $pair (@pairs){
($name, $value) = split(/=/, $pair);
if ($name eq "L1"){next;}
if ($name eq "S1"){next;}
if ($name eq "Submit"){next;}
if ($name eq "submit"){next;}
$name =~ tr/+/ /;
$name =~ tr/+/ /;
$name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$value =~ tr/+/ /;
$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$value =~ s/<!--(.|)*-->//g;
$gForm{$name} = $value;
print MAIL "$name:\n";
print MAIL "$value\n\n";}
close (MAIL);
print "location: $gForm{'L1'}\n\n";
sleep(1);