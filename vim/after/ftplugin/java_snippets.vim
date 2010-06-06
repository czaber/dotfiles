if !exists('loaded_snippet') || &cp
    finish
endif

function! UpFirst()
    return substitute(@z,'.','\u&','')
endfunction

function! JavaTestFileName(type)
    let filepath = expand('%:p')
    let filepath = substitute(filepath, '/','.','g')
    let filepath = substitute(filepath, '^.\(:\\\)\?','','')
    let filepath = substitute(filepath, '\','.','g')
    let filepath = substitute(filepath, ' ','','g')
    let filepath = substitute(filepath, '.*test.','','')
    if a:type == 1
        let filepath = substitute(filepath, '.[A-Za-z]*.java','','g')
    elseif a:type == 2
        let filepath = substitute(filepath, 'Tests.java','','')
    elseif a:type == 3
        let filepath = substitute(filepath, '.*\.\([A-Za-z]*\).java','\1','g')
    elseif a:type == 4
        let filepath = substitute(filepath, 'Tests.java','','')
        let filepath = substitute(filepath, '.*\.\([A-Za-z]*\).java','\1','g')
    elseif a:type == 5
        let filepath = substitute(filepath, 'Tests.java','','')
        let filepath = substitute(filepath, '.*\.\([A-Za-z]*\).java','\1','g')
        let filepath = substitute(filepath, '.','\l&','')
    endif

    return filepath
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet pro protected".st.et
exec "Snippet pr private".st.et
exec "Snippet pu public".st.et
exec "Snippet st static".st.et
exec "Snippet fi final".st.et
exec "Snippet im implements ".st.et
exec "Snippet ex extends ".st.et
exec "Snippet class ".st."public".et." class ".st."ClassName:UpFirst()".et." ".st.et."{<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet meth ".st."public".et." ".st."void".et." ".st."method".et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet jps private static final ".st."string".et." ".st.et." = \"".st.et."\";<CR>".st.et
exec "Snippet try try {<CR>".st.et."<CR>} catch (".st.et." e) {<CR>".st.et."<CR>} finally {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet log private static final Log log = LogFactory.getLog(getClass());<CR>".st.et
exec "Snippet jpv private ".st."string".et." ".st.et.";<CR><CR>".st.et
exec "Snippet bean // {{{ set".st."fieldName:UpFirst()".et."<CR>/**<CR> * Setter for ".st."fieldName".et.".<CR> * @param new".st."fieldName:UpFirst()".et." new value for ".st."fieldName".et."<CR> */<CR>public void set".st."fieldName:UpFirst()".et."(".st."String".et." new".st."fieldName:UpFirst()".et.") {<CR>".st."fieldName".et." = new".st."fieldName:UpFirst()".et.";<CR>}<CR>// }}}<CR><CR>// {{{ get".st."fieldName:UpFirst()".et."<CR>/**<CR> * Getter for ".st."fieldName".et.".<CR> * @return ".st."fieldName".et." */<CR>public ".st."String".et." get".st."fieldName:UpFirst()".et."() {<CR>return ".st."fieldName".et.";<CR>}<CR>// }}}<CR>".st.et
exec "Snippet wh while (".st.et.") { // ".st.et."<CR><CR>".st.et."<CR><CR>}<CR>".st.et
exec "Snippet sout System.out.println(\"".st.et."\");".st.et
exec "Snippet jtest package ".st."j:JavaTestFileName(1)".et."<CR><CR>import junit.framework.TestCase;<CR>import ".st."j:JavaTestFileName(2)".et.";<CR><CR>/**<CR> * ".st."j:JavaTestFileName(3)".et."<CR> *<CR> * @author ".st.et."<CR> * @since ".st.et."<CR> */<CR>public class ".st."j:JavaTestFileName(3)".et." extends TestCase {<CR><CR>private ".st."j:JavaTestFileName(4)".et." ".st."j:JavaTestFileName(5)".et.";<CR><CR>public ".st."j:JavaTestFileName(4)".et." get".st."j:JavaTestFileName(4)".et."() { return this.".st."j:JavaTestFileName(5)".et."; }<CR>public void set".st."j:JavaTestFileName(4)".et."(".st."j:JavaTestFileName(4)".et." ".st."j:JavaTestFileName(5)".et.") { this.".st."j:JavaTestFileName(5)".et." = ".st."j:JavaTestFileName(5)".et."; }<CR><CR>public void test".st.et."() {<CR>".st.et."<CR>}<CR>}<CR>".st.et
exec "Snippet fore for(".st."Object".et." ".st."var".et." : ".st."collection".et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet if if (".st.et.") {<CR>".st.et."<CR>} ".st.et
exec "Snippet elif else if (".st.et.") {<CR>".st.et."<CR>} ".st.et
exec "Snippet else else {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet main public main static void main(String[] ars) {<CR>".st."\"System.exit(0)\"".et.";<CR>}<CR>".st.et
