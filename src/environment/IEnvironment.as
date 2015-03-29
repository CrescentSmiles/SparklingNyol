package environment 
{
	import char.Char;
	
	/**
	 * ...
	 * @author zain
	 */
	public interface IEnvironment 
	{
		function addHero(hero:Char):void;
		function update():void;
		function destroy():void;
	}
	
}