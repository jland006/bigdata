

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cassandra.thrift.Cassandra;
import org.apache.cassandra.thrift.ColumnOrSuperColumn;
import org.apache.cassandra.thrift.ColumnParent;
import org.apache.cassandra.thrift.ConsistencyLevel;
import org.apache.cassandra.thrift.SlicePredicate;
import org.apache.cassandra.thrift.SliceRange;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


/**
 * Servlet implementation class get_images
 */
@WebServlet("/get_images")
public class get_images extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public get_images() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		
		TTransport tr = new TFramedTransport(new TSocket("virt2.cs.ucr.edu", 9160));
        TProtocol proto = new TBinaryProtocol(tr);
        try {
        	
	        Cassandra.Client client = new Cassandra.Client(proto);
	        tr.open();
	        String keyspace = "senior_design";
	        client.set_keyspace(keyspace);

	        //record id
	        String key_user_id = key;
	        String columnFamily = "all_classifiers";

	        ColumnParent columnParent = new ColumnParent(columnFamily);

	        //Gets column by key
	        String image = null;
	        SlicePredicate predicate = new SlicePredicate();
	        //SliceRange range = new SliceRange();
	        //range.setStart(ByteBuffer.wrap(new byte[0]));
	        //range.setFinish(ByteBuffer.wrap(new byte[0]));
	        int start = Integer.parseInt(request.getParameter("start"));
	        int end = start + 100;
	        predicate.setSlice_range(new SliceRange(ByteBuffer.wrap(new byte[0]), ByteBuffer.wrap(new byte[0]), false, end));
	        List<ColumnOrSuperColumn> columnsByKey = client.get_slice(ByteBuffer.wrap(key_user_id.getBytes()), columnParent, predicate, ConsistencyLevel.ALL);

	        String output = "";
	        JSONObject obj;

	        for(int j = start; (j < end) && (j < columnsByKey.size()); j++) {
	        //for(ColumnOrSuperColumn k : columnsByKey) {
	        	ColumnOrSuperColumn k = columnsByKey.get(j);
	        	JSONParser parser = new JSONParser();
	        	obj = (JSONObject) parser.parse((new String(k.getColumn().getValue(), "UTF-8")));
	        	JSONArray objArray = (JSONArray) obj.get("info");
	        	String boxes = "";
	    		for(int i = 0; i < objArray.size(); i++) {
	    			JSONObject box = (JSONObject) objArray.get(i);
	    			boxes += "<div class='box' data-ic-orgx=" + box.get("x") + " data-ic-orgy=" + 
	    					box.get("y") + " data-ic-orgw=" + 
	    					box.get("width") + " data-ic-orgh=" + box.get("height") + " ></div>";
	    		}
	        	image = new String(k.getColumn().getName(), "UTF-8");
		        output += "<div class='Image_Wrapper'><img src='" + image + "' />" + boxes + "</div>";
	        }
	     
	        response.getWriter().write(output);
	
	        tr.close();
        }
		catch (Exception e) {
			response.getWriter().write("Error");
		}
	}

}
