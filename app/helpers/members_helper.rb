module MembersHelper
  def friend_member_path(member, friend)
    (lookup_friends_with_shortest_path(member, friend)&.reverse&.join " -> ") || "No path found"
  end


  private

  def lookup_friends_with_shortest_path(source, target)
    level = 0
    friends_looked_already = []
    while true
      paths = []
      friends_looked_count = friends_looked_already.size
      if lookup_friends_by_level(source, target, level, paths, friends_looked_already)
        paths << source.name
        return paths
      elsif friends_looked_count == friends_looked_already.size
        return
      end
      level += 1
    end
  end

  def lookup_friends_by_level(source, target, level, paths, friends_looked_already)
    puts("lookup #{source.id} : #{target.id}")
    friends_looked_already << source.id unless friends_looked_already.include? source.id

    source.friends.each do |friend|
      puts("loop #{friend.friend_member.id} : #{target.id}")
      if level == 0
        if friend.friend_member.id == target.id
          paths << target.name
          return true
        end
      elsif lookup_friends_by_level(friend.friend_member, target, level - 1, paths, friends_looked_already)
        paths << friend.friend_member.name
        return true
      end
    end
    false
  end
end
