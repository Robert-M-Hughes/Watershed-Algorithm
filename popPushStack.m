frontier = []%create
frontier = [frontier 2]%push
frontier = [frontier 4]
frontier = [frontier 6]
frontier = [frontier 8]
frontier = [frontier 10]
q = frontier(length(frontier))%copy last
frontier(length(frontier))=[]%pop

%need to have frontier for the x and one for the y component