% iitdhthesis.cls
% Latex style file for Indian Institute of technology Dharwad PhD and MS theses.
% Version date: 22nd May 2025. Updated by Naveen K, IIT Dharwad.
% Updated RPC thesis recommendation certificate.
%
% This style file is a suitably modified version of IIT Bombay's thesis format, which 
% was originally make by 
%   by Amey Karkare 2007/06/20
%   according to the guidelines given on the webpage 
%   http://gymkhana.iitb.ac.in/~rsf/old/formatthesis.htm
%
% Many commands copied from withesis.cls from 
% http://www.ctan.org/tex-archive/macros/latex/contrib/withesis/
%
% Revisions:
% 18/09/2007: Support for  ``External Guide'' added.
%             The changes submitted by: Anil Nair <talk2anil [AT] gmail.com> 
%=============================================================================
% Licensed under the Perl Artistic License.
% see: http://www.ctan.org/tex-archive/help/Catalogue/licenses.artistic.html
% for more info...
%=============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iitdhthesis}[2007/06/25 IIT Dharwad Thesis Format]
\typeout{Document Class `iitdhthesis' v1 <22 May 2025>}


%=============================================================================
% TBD: We need options to switch between Annual Progress Report,
%      Presynopsis, Synopsis and final thesis, and between different
%      types of reports. 
%=============================================================================
%\DeclareOption{aps}{}
%\DeclareOption{presynopsis}{}
%\DeclareOption{synopsis}{}
%\DeclareOption{thesis}{}
%\DeclareOption{dissertation}{}
%\DeclareOption{project}{}

%=============================================================================
% Pass the options to report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Defaults ...
\ProcessOptions

%=============================================================================
% a4paper: thesis must be printed on a4 size paper. 
% 12pt:    font size must be 12 pt
%
% As iitbthesis class is a simple extension of report class, we simply
% pass default options to report class.
% =============================================================================
\PassOptionsToClass{12pt,a4paper}{report}
\LoadClass{report}

% who is advisor?
\def\@advisorname{None}
\newcommand{\setguide}[1]{\def\@advisorname{#1}}

% and coadvisor? (initialized to empty)
\global\let\@coadvisorname\@empty
\newcommand{\setcoguide}[1]{\def\@coadvisorname{#1}}
\let\coguide\setcoguide %
\newcommand{\show@coguide}{\@coadvisorname}

% and exadvisor? (initialized to empty)
\global\let\@exadvisorname\@empty
\newcommand{\setexguide}[1]{\def\@exadvisorname{#1}}
\let\exguide\setexguide %
\newcommand{\show@exguide}{\@exadvisorname}

\global\let\@exadvisoraff\@empty
\newcommand{\setexguideaffiliation}[1]{\def\@exadvisoraff{#1}}
\let\exguideaffiliation\setexguideaffiliation %
\newcommand{\show@exguideaff}{\@exadvisoraff}

% Who are examiners
\def\@exexaminername{}
\newcommand{\setexexaminer}[1]{\def\@exexaminername{#1}}
\def\@exexamineraffiliation{}
\newcommand{\setexexamineraffiliation}[1]{\def\@exexamineraffiliation{#1}}
\def\@intexaminername{None}
\newcommand{\setintexaminer}[1]{\def\@intexaminername{#1}}

\def\@chairmanname{}
\newcommand{\setchairman}[1]{\def\@chairmanname{#1}}

%\global\let\@rpc\@empty
%\newcommand{\setrpc}[1]{\def\@rpc{#1}}
%\let\rpc\setrpc %
%\newcommand{\show@rpc}{\@rpc}



%=============================================================================
% TITLE PAGE
%   - define \title{} \author{} \date{}
%   - The default degree is ``Unknown Degree''
%     Degree can be changed using the command \iitbdegree{}
%   - The default department is ``Unknown Department''
%     The department can be changed using the command \department{}
%   - The default document type is ``A preliminary report''
%     The document type can be changed using the command \reporttype{}
%     There are some short-cuts for \reporttype{}:
%      * for a PhD thesis, specify \thesis
%      * for a M.Tech./M.Phil./M.Des./M.S. dissertation, specify \dissertation
%      * for a DIIT/B.Tech./M.Sc.project report, specify \project
%      * for a preliminary report, specify \prelim
%   - once the above are defined, use \maketitle to generate the titlepage
%=============================================================================
\newcommand\@thesistitlemedskip{0.25in}
\newcommand\@thesistitlebigskip{0.6in}
\newcommand{\rollnum}[1]{\gdef\@rollnum{#1}}
\newcommand{\iitbdegree}[1]{\gdef\@iitbdegree{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\reporttype}[1]{\gdef\@doctype{#1}}
\newcommand{\approvaltype}[1]{\gdef\@approvaltype{#1}}

\newcommand{\thesis}{\reporttype{thesis}\approvaltype{Thesis}}
\newcommand{\dissertation}{\reporttype{dissertation}\approvaltype{Dissertation}}
\newcommand{\project}{\reporttype{project report}\approvaltype{Report}}
\newcommand{\prelim}{\reporttype{preliminary report}\approvaltype{Report}}

\gdef\@rollnum{Unknown 00000000}    % Default is Unknown 00000000
\gdef\@iitbdegree{Unknown Degree}    % Default is Unknown Degree
\gdef\@doctype{preliminary report}  % Default is a preliminary report
\gdef\@department{(Unknown Department)} % Default is Unknown

\renewcommand{\maketitle}{%
  \begin{titlepage}
%-----------------------------------------------------------------------------
% -- The thesis office doesn't like thanks on title page.  Put it in
% -- the acknowledgments.  This is here so you don't have to change
% -- your titlepage when converting from report style. -> from Purdue, but I
%        left it here since it seems compatible with UW-Madison, Eric -
%    Amey - I also left it here as IITB does not say anything about it.
%-----------------------------------------------------------------------------
    \def\thanks##1{\typeout{Warning: `thanks' deleted from thesis titlepage.}}
    \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}

    \begin{center}
      %\mbox{}

      {\bf\expandafter\uppercase\expandafter{\LARGE\@title}} \\[\@thesistitlemedskip]
      {\large A \@doctype\ submitted in partial fulfillment of} \\
      {\large the requirements for the degree of}\\[\@thesistitlemedskip]
      {\large \@iitbdegree} \\[\@thesistitlemedskip]
      {\large by} \\[\@thesistitlemedskip]
      {\large \bf \@author} \\
      {\large \bf (Roll No. \@rollnum)} \\[\@thesistitlemedskip]
      {\large Under the guidance of }  \\
      {\large \bf \@advisorname} \\
      \ifx\@coadvisorname\@empty
         \ifx\@exadvisorname\@empty
             \mbox{}\\[\@thesistitlebigskip]
	 \else
	     {\large and } \\
	     {\large \bf \@exadvisorname} \\[\@thesistitlemedskip]
	 \fi %
      \else
          \ifx\@exadvisorname\@empty
	      {\large and } \\
	      {\large \bf \@coadvisorname} \\[\@thesistitlemedskip]
	  \else
	      {\large \bf \@coadvisorname} \\%[\@thesistitlemedskip]
	      {\large and } \\
	      {\large \bf \@exadvisorname} \\[\@thesistitlemedskip]
	  \fi %
      \fi %
      %\input{./iitdhlogo.tex} \\[\@thesistitlemedskip]
      \includegraphics[width=4.5cm]{./IIT_Dharwad_logo.eps} \\[\@thesistitlemedskip]
      {\large \uppercase{\@department}} \\%[\@thesistitlemedskip]
      {\large INDIAN INSTITUTE OF TECHNOLOGY DHARWAD}\\%[\@thesistitlemedskip]
      {\large \@date}
    \end{center}
  \end{titlepage}
  \setcounter{footnote}{0}
  \setcounter{page}{1} %title page is NOT counted
}

%=============================================================================
% DEDICATION
%=============================================================================
% The dedication environment must do the following:
% - start a new page
% - center the text vertically
% - include the text in a center environment
%=============================================================================
\def\dedication{
  \newpage
  \thispagestyle{empty}    % No page number
  \setcounter{page}{0}
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \thispagestyle{empty}    % No page number
  \null\vfil
  \begin{center}}
\def\enddedication{\end{center}\par\vfil\newpage}

%=============================================================================
% APPROVAL SHEET
% - start a new page. page 
% - center the text vertically
%=============================================================================
\newcommand\@thesisapprovalmedskip{0.2in}
\newcommand\@thesisapprovalbigskip{0.5in}
\newcommand\@thesisapprovalsmallskip{0.1in}
\newcommand\@thesisapprovalnoskip{0.05in}

\newcommand{\makeapproval}{
  %\setcounter{page}{2}
  \cleardoublepage
  \thispagestyle{empty}
  \ifx\@coadvisorname\@empty
  \ifx\@exadvisorname\@empty % no co-advisor/external advisor
  \begin{center}
    {\LARGE \bf \@approvaltype\ Approval}\\[\@thesisapprovalbigskip]
    {\large The \@doctype\ entitled}\\[\@thesisapprovalmedskip]
    {\bf\expandafter\uppercase\expandafter{\LARGE\@title}}\\[\@thesisapprovalmedskip]
    {\large by}\\[\@thesisapprovalmedskip]
    {\Large \bf \@author }\\
    {\Large (Roll No. \@rollnum)}\\[\@thesisapprovalmedskip]
    {\large is approved for the degree of} \\[\@thesisapprovalmedskip]
    {\large \@iitbdegree } \\[\@thesisapprovalbigskip]
    \begin{tabular}{ccc}
      \rule{6cm}{1sp}                &\rule{10mm}{0pt}& \rule{6cm}{1sp} \\
      {\Large Internal Examiner}     && {\Large External Examiner} \\      
      {\large \@intexaminername}     && {\large \@exexaminername} \\
      {}                             && {\normalsize Affiliation: \@exexamineraffiliation} \\[\@thesisapprovalmedskip]\\

      \rule{6cm}{1sp}                && \rule{6cm}{1sp} \\
      {\Large Supervisor}                 && {\Large Chairman} \\ 
      {\large \@advisorname}         && {\large \@chairmanname} \\ [\@thesisapprovalmedskip]\\
      {\Large Date:} \rule{4cm}{1sp} && \\ && \\
      {\Large Place:} \rule{4cm}{1sp}&&
    \end{tabular}
  \end{center}
  \else % only external advisor
  \begin{center}
    {\LARGE \bf \@approvaltype\ Approval}\\[\@thesisapprovalsmallskip]
    {\large The \@doctype\ entitled}\\[\@thesisapprovalmedskip]
    {\bf\expandafter\uppercase\expandafter{\LARGE\@title}}\\[\@thesisapprovalsmallskip]
    {\large by}\\[\@thesisapprovalsmallskip]
    {\Large \bf \@author }\\
    {\Large (Roll No. \@rollnum)}\\[\@thesisapprovalsmallskip]
    {\large is approved for the degree of} \\[\@thesisapprovalsmallskip]
    {\large \@iitbdegree } \\[\@thesisapprovalbigskip]
    \begin{tabular}{ccc}
      \rule{6cm}{1sp}                &\rule{10mm}{0pt}& \rule{6cm}{1sp} \\
      {\Large Internal Examiner}     && {\Large External Examiner} \\      
      {\large \@intexaminername}     && {\large \@exexaminername} \\
      {}                             && {\normalsize Affiliation: \@exexamineraffiliation} \\[\@thesisapprovalmedskip]\\

      \rule{6cm}{1sp}                && \rule{6cm}{1sp} \\
      {\Large Supervisor}            && {\Large External supervisor} \\ 
      {\large \@advisorname}         && {\large \@exadvisorname} \\ [\@thesisapprovalmedskip]\\
      \multicolumn{3}{c}{\rule{6cm}{1sp}} \\
      \multicolumn{3}{c}{\Large Chairman} \\
      \multicolumn{3}{c}{\large \@chairmanname} \\ [\@thesisapprovalmedskip]\\
      {\Large Date:} \rule{4cm}{1sp} && \\[1ex]
      {\Large Place:} \rule{4cm}{1sp}&&
    \end{tabular}
  \end{center}
  \fi %
    \else % coadvisor
        \ifx\@exadvisorname\@empty % but no external advisor 
    \begin{center}
    {\LARGE \bf \@approvaltype\ Approval}\\[\@thesisapprovalsmallskip]
    {\large The \@doctype\ entitled}\\[\@thesisapprovalmedskip]
    {\bf\expandafter\uppercase\expandafter{\LARGE\@title}}\\[\@thesisapprovalsmallskip]
    {\large by}\\[\@thesisapprovalsmallskip]
    {\Large \bf \@author }\\
    {\Large (Roll No. \@rollnum)}\\[\@thesisapprovalsmallskip]
    {\large is approved for the degree of} \\[\@thesisapprovalsmallskip]
    {\large \@iitbdegree } \\[\@thesisapprovalbigskip]
    \begin{tabular}{ccc}
      \rule{6cm}{1sp}                &\rule{10mm}{0pt}& \rule{6cm}{1sp} \\
      {\Large Internal Examiner}     && {\Large External Examiner} \\      
      {\large \@intexaminername}     && {\large \@exexaminername} \\
      {}                             && {\normalsize Affiliation: \@exexamineraffiliation} \\[\@thesisapprovalmedskip]\\

      \rule{6cm}{1sp}                && \rule{6cm}{1sp} \\
      {\Large Supervisor}            && {\Large Co-supervisor} \\ 
      {\large \@advisorname}         && {\large \@coadvisorname} \\ [\@thesisapprovalmedskip]\\
      \multicolumn{3}{c}{\rule{6cm}{1sp}} \\
      \multicolumn{3}{c}{\Large Chairman} \\
      \multicolumn{3}{c}{\large \@chairmanname} \\ [\@thesisapprovalmedskip]\\
      {\Large Date:} \rule{4cm}{1sp} && \\[1ex]
      {\Large Place:} \rule{4cm}{1sp}&&
    \end{tabular}
   \end{center}
    \else % both co-advisor and external advisor
    \begin{center}
    {\LARGE \bf \@approvaltype\ Approval}\\[\@thesisapprovalsmallskip]
    {\large The \@doctype\ entitled}\\[\@thesisapprovalsmallskip]
    {\bf\expandafter\uppercase\expandafter{\LARGE\@title}}\\[\@thesisapprovalsmallskip]
    {\large by}\\[\@thesisapprovalsmallskip]
    {\Large \bf \@author }\\
    {\Large (Roll No. \@rollnum)}\\[\@thesisapprovalsmallskip]
    {\large is approved for the degree of} \\[\@thesisapprovalsmallskip]
    {\large \@iitbdegree } \\[\@thesisapprovalbigskip]
    \begin{tabular}{ccc}
      \rule{6cm}{1sp}                &\rule{10mm}{0pt}& \rule{6cm}{1sp} \\
      {\Large Internal Examiner}     && {\Large External Examiner} \\      
      {\large \@intexaminername}     && {\large \@exexaminername} \\
      {}                             && {\normalsize Affiliation: \@exexamineraffiliation} \\[\@thesisapprovalmedskip]\\
      \rule{6cm}{1sp}                && \rule{6cm}{1sp} \\
      {\Large Supervisor}            && {\Large Co-supervisor} \\ 
      {\large \@advisorname}         && {\large \@coadvisorname} \\ [\@thesisapprovalmedskip]\\
      \rule{6cm}{1sp}                && \rule{6cm}{1sp} \\
      {\Large External supervisor}   && {\Large Chairman} \\ 
      {\large \@exadvisorname}         && {\large \@chairmanname} \\ [\@thesisapprovalmedskip]\\
   
      {\Large Date:} \rule{4cm}{1sp} && \\[1ex]
      {\Large Place:} \rule{4cm}{1sp}&&
    \end{tabular}
  \end{center}

    \fi %exadvisor empty
    \fi %coadvisor empty
     
 %change ends    

  %\end{center}
  \let\thanks\relax
  \let\maketitle\relax \let\iitbdegree\relax \let\project\relax \let\prelim\relax
  \let\department\relax
  \gdef\@thanks{}\gdef\@iitbdegree{}\gdef\@doctype{}
  \gdef\@department{}
}

%=============================================================================
% RPC Approval page
%=============================================================================

% In your .cls file

\RequirePackage{etoolbox}
\RequirePackage{array}

% Counter for RPC members
\newcounter{rpccount}
\setcounter{rpccount}{0}

% Storage for RPC member names
\newcommand{\rpc@member@i}{}
\newcommand{\rpc@memberaff@i}{IIT Dharwad}
\newcommand{\rpc@member@ii}{}
\newcommand{\rpc@memberaff@ii}{IIT Dharwad}
\newcommand{\rpc@member@iii}{}
\newcommand{\rpc@memberaff@iii}{IIT Dharwad}
\newcommand{\rpc@member@iv}{}
\newcommand{\rpc@memberaff@iv}{IIT Dharwad}
\newcommand{\rpc@member@v}{}
\newcommand{\rpc@memberaff@v}{IIT Dharwad}
\newcommand{\rpc@member@vi}{}
\newcommand{\rpc@memberaff@vi}{IIT Dharwad}
% Add more as needed

% Commands to set RPC members
\newcommand{\setrpcone}[1]{%
    \renewcommand{\rpc@member@i}{#1}%
    \ifnum\value{rpccount}<1\setcounter{rpccount}{1}\fi%
}
\newcommand{\setrpconeaff}[1]{%
    \renewcommand{\rpc@memberaff@i}{#1}%
}
\newcommand{\setrpctwo}[1]{%
    \renewcommand{\rpc@member@ii}{#1}%
    \ifnum\value{rpccount}<2\setcounter{rpccount}{2}\fi%
}
\newcommand{\setrpctwoaff}[1]{%
    \renewcommand{\rpc@memberaff@ii}{#1}%
}

\newcommand{\setrpcthree}[1]{%
    \renewcommand{\rpc@member@iii}{#1}%
    \ifnum\value{rpccount}<3\setcounter{rpccount}{3}\fi%
}

\newcommand{\setrpcthreeaff}[1]{%
    \renewcommand{\rpc@memberaff@iii}{#1}%
}

\newcommand{\setrpcfour}[1]{%
    \renewcommand{\rpc@member@iv}{#1}%
    \ifnum\value{rpccount}<4\setcounter{rpccount}{4}\fi%
}

\newcommand{\setrpcfouraff}[1]{%
    \renewcommand{\rpc@memberaff@iv}{#1}%
}


\newcommand{\setrpcfive}[1]{%
    \renewcommand{\rpc@member@v}{#1}%
    \ifnum\value{rpccount}<5\setcounter{rpccount}{5}\fi%
}

\newcommand{\setrpcfiveaff}[1]{%
    \renewcommand{\rpc@memberaff@v}{#1}%
}

\newcommand{\setrpcsix}[1]{%
    \renewcommand{\rpc@member@vi}{#1}%
    \ifnum\value{rpccount}<6\setcounter{rpccount}{6}\fi%
}

\newcommand{\setrpcsixaff}[1]{%
    \renewcommand{\rpc@memberaff@vi}{#1}%
}

% Helper command to generate signature line
\newcommand{\rpc@signatureline}[2]{%
    \begin{minipage}[t]{0.4\textwidth}
        %\centering
        \vspace{1.5cm}
        \rule{5cm}{0.4pt}\\
        {Name: #1}\\
        {Affiliation: #2}\\
        {Role: RPC Member}\\
    \end{minipage}%
}
\newcommand{\guide@signatureline}{%
    \begin{minipage}[t]{0.4\textwidth}
        %\centering
        \vspace{1.5cm}
        \rule{5cm}{0.4pt}\\[0.3cm]
        {Name: \@advisorname}\\
        {Affiliation: IIT Dharwad}\\
        {Role: Supervisor}\\
    \end{minipage}%
}
\newcommand{\coguide@signatureline}{%
    \begin{minipage}[t]{0.4\textwidth}
        %\centering
        \vspace{1.5cm}
        \rule{5cm}{0.4pt}\\
        {Name: \@coadvisorname}\\
        {Affiliation: IIT Dharwad}\\
        {Role: Co-supervisor}\\
    \end{minipage}%
}
\newcommand{\exguide@signatureline}{%
    \begin{minipage}[t]{0.4\textwidth}
        %\centering
        \vspace{1.5cm}
        \rule{5cm}{0.4pt}\\
        {Name: \@exadvisorname}\\
        {Affiliation: \@exadvisoraff}\\
        {Role: External supervisor}\\
    \end{minipage}%
}

% Main command to generate RPC approval page
\newcommand{\makerpcpage}{%

  \cleardoublepage
  \thispagestyle{empty}
 %    \clearpage
 %    \thispagestyle{empty}
    
 \begin{center}
     {\LARGE \bf RPC Approval for \@approvaltype\ Submission}\\[\@thesisapprovalmedskip]
 \end{center}
    {\large This is to certify that the thesis titled {\bf \@title} by  \@author~(\@rollnum) is approved for final submission by the Research Progress Committee.} \\[-1cm]
  
  \ifx\@coadvisorname\@empty
  \ifx\@exadvisorname\@empty % no co-advisor/external advisor
    % Generate signatures based on count
    \ifcase\value{rpccount}%
        % 0 members - error case
        \textbf{Error: No RPC members specified}
    \or%
        % 1 member
         \textbf{Error: As per Senate rules, the minimum number of RPC members should be two.}
    \or%
        % 2 members
        \begin{center}
            \guide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill~%\rpc@signatureline{\rpc@member@ii}
        \end{center}
    \or%
        % 3 members
        \begin{center}
            \guide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}
        \end{center}
    \or%
        % 4 members
        \begin{center}
            \guide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill~
        \end{center}
    \or%
        % 5 members
        \begin{center}
            \guide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill\rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}
        \end{center}
    \or%
        % 6 members
        \begin{center}
            \guide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill\rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@vi}{\rpc@memberaff@vi}\hfill~%\rpc@signatureline{\rpc@member@vi}
        \end{center}
    \else%
        % More than 6 members - you can extend this
        \textbf{Error: Too many RPC members (maximum 6 supported)}
    \fi%
  \else % only external advisor
     % Generate signatures based on count
    \ifcase\value{rpccount}%
        % 0 members - error case
        \textbf{Error: No RPC members specified}
    \or%
        % 1 member
         \textbf{Error: As per Senate rules, the minimum number of RPC members should be two.}
    \or%
        % 2 members
        \begin{center}
            \guide@signatureline\hfill\exguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}
        \end{center}
    \or%
        % 3 members
        \begin{center}
            \guide@signatureline\hfill\exguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill~
        \end{center}
    \or%
        % 4 members
        \begin{center}
            \guide@signatureline\hfill\exguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}
        \end{center}
    \or%
        % 5 members
        \begin{center}
            \guide@signatureline\hfill\exguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\hfill~
        \end{center}
    \or%
        % 6 members
        \begin{center}
            \guide@signatureline\hfill\exguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\hfill\rpc@signatureline{\rpc@member@vi}{\rpc@memberaff@vi}
        \end{center}
    \else%
        % More than 6 members - you can extend this
        \textbf{Error: Too many RPC members (maximum 6 supported)}
    \fi%
    \fi
    \else %coadvisor
    \ifx\@exadvisorname\@empty % but no external advisor
     % Generate signatures based on count
    \ifcase\value{rpccount}%
        % 0 members - error case
        \textbf{Error: No RPC members specified}
    \or%
        % 1 member
         \textbf{Error: As per Senate rules, the minimum number of RPC members should be two.}
    \or%
        % 2 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}
        \end{center}
    \or%
        % 3 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill~
        \end{center}
    \or%
        % 4 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}
        \end{center}
    \or%
        % 5 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\hfill~
        \end{center}
    \or%
        % 6 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\hfill\rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\hfill\rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\hfill\rpc@signatureline{\rpc@member@vi}{\rpc@memberaff@vi}
        \end{center}
    \else%
        % More than 6 members - you can extend this
        \textbf{Error: Too many RPC members (maximum 6 supported)}
    \fi%
    \else % both co-advisor and external advisor
     % Generate signatures based on count
     % Generate signatures based on count
    \ifcase\value{rpccount}%
        % 0 members - error case
        \textbf{Error: No RPC members specified}
    \or%
        % 1 member
         \textbf{Error: As per Senate rules, the minimum number of RPC members should be two.}
    \or%
        % 2 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \exguide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill~%\rpc@signatureline{\rpc@member@ii}
        \end{center}
    \or%
        % 3 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \exguide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}
        \end{center}
    \or%
        % 4 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \exguide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill~%\rpc@signatureline{\rpc@member@iv}
        \end{center}
    \or%
        % 5 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\[\@thesisapprovalsmallskip]
            \exguide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\[\@thesisapprovalsmallskip]
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill\rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}
        \end{center}
    \or%
        % 6 members
        \begin{center}
            \guide@signatureline\hfill\coguide@signatureline\\
            \exguide@signatureline\hfill\rpc@signatureline{\rpc@member@i}{\rpc@memberaff@i}\\
            \rpc@signatureline{\rpc@member@ii}{\rpc@memberaff@ii}\hfill\rpc@signatureline{\rpc@member@iii}{\rpc@memberaff@iii}\\
            \rpc@signatureline{\rpc@member@iv}{\rpc@memberaff@iv}\hfill\rpc@signatureline{\rpc@member@v}{\rpc@memberaff@v}\\
            \rpc@signatureline{\rpc@member@vi}{\rpc@memberaff@vi}\hfill~%\rpc@signatureline{\rpc@member@vi}
        \end{center}
    \else%
        % More than 6 members - you can extend this
        \textbf{Error: Too many RPC members (maximum 6 supported)}
    \fi%
   \fi
   \fi
    
   % \vfill
    
   % \begin{center}
   %     \textit{Approved on: \rule{4cm}{0.4pt}}
   % \end{center}
    
   % \clearpage
}



%=============================================================================
% CERTIFICATE OF COURSE WORK
%=============================================================================
% joining date is required for certificate of course work
\newcommand{\joiningdate}[1]{\gdef\@joindate{#1}}
\gdef\@joindate{``Unknown''}
%   - define counters for course numbers & credits, initialize to 0
\newcounter{@course}\setcounter{@course}{0}
\newcounter{@credits}\setcounter{@credits}{0}

%   - command to add a course. it accepts 3 arguments:
%     Course ID, Course Name, and Course Credits.
\newcommand{\addcourse}[3]{%
  \addtocounter{@course}{1}
  \the@course & #1 & #2 & #3
  \addtocounter{@credits}{#3} \\\hline}
\newcommand{\addppcourse}[3]{%
  \addtocounter{@course}{1}
  \the@course & #1 & #2 & #3
  \\\hline}

%  - finally the environment to print course list in tabular form
\newenvironment{coursecertificate}{
  \newpage
  %\setcounter{page}{0}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\Large INDIAN INSTITUTE OF TECHNOLOGY BOMBAY, INDIA}\\
    \vspace{.3in}
    {\Large \bf CERTIFICATE OF COURSE WORK}\\
    \vspace{.5in}
  \end{center}
  {\large This is to certify that {\bf \@author} (Roll No. \@rollnum)
    was admitted to the candidacy of Ph.D. degree on \@joindate,
    after successfully completing all the courses required for the
    Ph.D. programme. The details of the course work done are given
    below.}\\
  \vspace{.3in}\\
  \begin{tabular}{|r|l|p{10cm}|r|}
    \hline
    {\bf S.No} & {\bf Course Code} & {\bf Course Name} & {\bf Credits}\\
    \hline\hline}% Begining of environment
  {
    \hline
    & & {\bf Total Credits} & {\bf \the@credits} \\ \hline
  \end{tabular}
  
  \vfill
  {\large 
  \begin{tabular}{lp{2.2in}r}
    IIT Bombay &&\\
    Date: & &Dy. Registrar (Academic)
  \end{tabular}} % End of Course Certificate
}


%=============================================================================
% ABSTRACT
%=============================================================================
% The abstract should begin with two single-spaced lines describing
% the author and title in a standard format.  After these lines comes
% the standard abstract.
%=============================================================================
\def\abstract{
  \chapter*{\centering  Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
  \relax\markboth{ABSTRACT}{ABSTRACT}}
\def\endabstract{\par\newpage}

%=============================================================================
% COPYRIGHTPAGE
% The copyright must do the following:
% - start a new page with no number
% - place the copyright text centered at the bottom.
%=============================================================================
\def\copyrightpage{
  \newpage
  \thispagestyle{empty}    % No page number
  \setcounter{page}{0}
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \begin{center}
   \vfill
   \copyright\ Copyright by \@author\ \@date\\
   All Rights Reserved
  \end{center}}


%=============================================================================
% GLOSSARY
%=============================================================================
% The glossary environment must do the following:
% - produce the table of contents entry for the glossary
% - start a new page with GLOSSARY centered two inches from the top
%=============================================================================
\def\glossary{
  \chapter*{Glossary}
  \addcontentsline{toc}{chapter}{Glossary}}
\def\endglossary{\par\newpage}

%=============================================================================
% NOMENCLATURE
%=============================================================================
% The nomenclature environment must do the following:
% - produce the table of contents entry for the nomenclature section
% - start a new page with NOMENCLATURE centered two inches from the top
%=============================================================================
\def\nomenclature{ 
  \chapter*{Nomenclature}
  \addcontentsline{toc}{chapter}{Nomenclature}}
\def\endnomenclature{\par\newpage}

%=============================================================================
% LIST OF SYMBOLS
%=============================================================================
% The list of symbols environment must do the following:
% - produce the table of contents entry for the list of symbols section
% - start a new page with LIST OF SYMBOLS centered two inches from the top
%=============================================================================
\def\listofsymbols{
  \chapter*{List of Symbols}
  \addcontentsline{toc}{chapter}{List of Symbols}}
\def\endlistofsymbols{\par\newpage}

%=============================================================================
% VITA
%=============================================================================
% The vita environment must do the following:
% - produce a separator page with the word vita centered
% - produce the table of contents entry for the vita
% - start a new page with VITA centered two inches from the top
%=============================================================================
\def\vita{
  \chapter*{Vita}
  \addcontentsline{toc}{chapter}{Vita}}
\def\endvita{\par\newpage}

%=============================================================================
% ACKNOWLEDGMENTS
%=============================================================================
% The acknowledgments environment must do the following:
% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
%=============================================================================
\def\acknowledgments{
  \chapter*{Acknowledgments}
  \thispagestyle{empty}
  \doublespace}
\def\endacknowledgments{%
  \vskip 5cm
  \noindent{\large Date: \rule{4cm}{1sp}\hfill\@author\rule{1cm}{0pt}}
  \par\newpage}

%=============================================================================
% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.
%=============================================================================
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \singlespace#1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%=============================================================================
% LIST OF FIGURES; LIST OF TABLES
%  These macros from report.cls have been modified to add entry in the
%  Contents table
%=============================================================================
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%=============================================================================
% These commands can be used in the thesis to switch between single
% and double spacing.  This is needed, for instance, in the abstract.
%=============================================================================
\newcommand{\oneskip}{1.0}
\newcommand{\twoskip}{1.5}
\newcommand{\singlespace}
  {\renewcommand{\baselinestretch}{\oneskip}\Large\normalsize}
\newcommand{\doublespace}
  {\renewcommand{\baselinestretch}{\twoskip}\Large\normalsize}

%=============================================================================
% Finally set the various lengths/margins as required by IITB format
% Check out LaTeX Companion for more details.
%=============================================================================
% Paper height & width (A4 paper) - set by a4paper option to report
%\setlength{\paperheight}{297mm}
%\setlength{\paperwidth}{210mm}
% total text area: height & width
\setlength{\textheight}{245mm}
\setlength{\textwidth}{160mm}

\setlength{\headheight}{3mm}
\setlength{\headsep}{12mm}
\setlength{\topmargin}{15mm}
% left side empty space on odd- & even-numbered pages
\if@twoside
  \typeout{Two side is true}
  \setlength{\oddsidemargin}{30mm}  % for two side printing
  \setlength{\evensidemargin}{20mm}
\else
  \typeout{Two side is false}
  \setlength{\oddsidemargin}{30mm}  % for one side printing
  \setlength{\evensidemargin}{30mm} % odd side margin = even side margin
\fi
\setlength{\hoffset}{-1in} % already accounted for in the margins
\setlength{\voffset}{-1in} % already accounted for in the margins
% line, paragraphs indent & spacing
\setlength{\parindent}{5ex} % indentation 5 characters approx.

\doublespace

%=============================================================================
% END FILE
%=============================================================================
