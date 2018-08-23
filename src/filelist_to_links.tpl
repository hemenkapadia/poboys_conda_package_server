<h1>{{header}}</h1>

%for f in filelist:
    <div>
        <a href="{{prefix}}{{parenturl}}/{{f}}">{{f}}</a>
    %if allow_delete:
        <form action="{{prefix}}/delete{{parenturl}}/{{f}}" method="post">
            <input type="submit" value="Delete" />
        </form>
    %end
    %if anaconda_release:
        <form action="{{prefix}}/anaconda/release{{parenturl}}/{{f}}" method="post">
            <input type="submit" value="Anaconda Release" />
        </form>
    %end
    </div>
%end
