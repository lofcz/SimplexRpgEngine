/// FindMovementRange(id, range)

   var _start, _moverange;
    _start = argument0;
    _moverange = argument1;

    var _priorityOpen, _listClosed, _mapDist;
    _priorityOpen = ds_priority_create();
    _listClosed = ds_list_create();
    _mapDist = ds_map_create();
    
    ds_priority_add( _priorityOpen, _start, 0 );
    ds_map_add( _mapDist, _start, 0 );
    _start.Parent = 0;
    _start.Reachable = true;
    
    while ( ds_priority_size( _priorityOpen ) )
    {
        var _current;
        _current = ds_priority_delete_min( _priorityOpen );
        ds_list_add( _listClosed, _current );
        
        var _predist;
        _predist = ds_map_find_value( _mapDist, _current );
        
        with ( _current.Right )
        {
            var _dist;
            _dist = _predist + Cost;
            if ( ds_list_find_index( _listClosed, id ) == -1 && Cost && _dist <= _moverange )
            {
                if ( ds_priority_find_priority( _priorityOpen, id ) == 0 )
                {
                    ds_priority_add( _priorityOpen, id, _dist );
                    ds_map_add( _mapDist, id, _dist );
                    Parent = _current;
                    Reachable = true;
                }
                else
                {
                    if ( _dist < ds_priority_find_priority( _mapDist, id ) )
                    {
                        ds_priority_change_priority( _priorityOpen, id, _dist );
                        ds_map_replace( _mapDist, id, _dist );
                        Parent = _current;
                    }
                }
            }
        }

        with ( _current.Up )
        {
            var _dist;
            _dist = _predist + Cost;
            if ( ds_list_find_index( _listClosed, id ) == -1 && Cost && _dist <= _moverange )
            {
                if ( ds_priority_find_priority( _priorityOpen, id ) == 0 )
                {
                    ds_priority_add( _priorityOpen, id, _dist );
                    ds_map_add( _mapDist, id, _dist );
                    Parent = _current;
                    Reachable = true;
                }
                else
                {
                    if ( _dist < ds_priority_find_priority( _mapDist, id ) )
                    {
                        ds_priority_change_priority( _priorityOpen, id, _dist );
                        ds_map_replace( _mapDist, id, _dist );
                        Parent = _current;
                    }
                }
            }
        }
        
        with ( _current.Left )
        {
            var _dist;
            _dist = _predist + Cost;
            if ( ds_list_find_index( _listClosed, id ) == -1 && Cost && _predist + Cost <= _moverange )
            {
                if ( ds_priority_find_priority( _priorityOpen, id ) == 0 )
                {
                    ds_priority_add( _priorityOpen, id, _dist );
                    ds_map_add( _mapDist, id, _dist );
                    Parent = _current;
                    Reachable = true;
                }
                else
                {
                    if ( _dist < ds_priority_find_priority( _mapDist, id ) )
                    {
                        ds_priority_change_priority( _priorityOpen, id, _dist );
                        ds_map_replace( _mapDist, id, _dist );
                        Parent = _current;
                    }
                }
            }
        }
        
        with ( _current.Down )
        {
            var _dist;
            _dist = _predist + Cost;
            if ( ds_list_find_index( _listClosed, id ) == -1 && Cost && _predist + Cost <= _moverange )
            {
                if ( ds_priority_find_priority( _priorityOpen, id ) == 0 )
                {
                    ds_priority_add( _priorityOpen, id, _dist );
                    ds_map_add( _mapDist, id, _dist );
                    Parent = _current;
                    Reachable = true;
                }
                else
                {
                    if ( _dist < ds_priority_find_priority( _mapDist, id ) )
                    {
                        ds_priority_change_priority( _priorityOpen, id, _dist );
                        ds_map_replace( _mapDist, id, _dist );
                        Parent = _current;
                    }
                }
            }
        }
    }
    
    ds_priority_destroy( _priorityOpen );
    ds_list_destroy( _listClosed );
    ds_map_destroy( _mapDist );
