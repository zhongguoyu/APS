package com.aps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.pojo.Animal;
import com.aps.pojo.Association;
import com.aps.service.AnimalService;
import com.aps.service.AssociationService;
import com.aps.util.Token;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

@Controller
public class UploadImgController {
	@Autowired
	private AssociationService associationService;
	@Autowired
	private AnimalService animalService;
	
	@RequestMapping("upload1")
	public String upload1(HttpServletRequest request, HttpServletResponse response,ModelMap map) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		//是否上传成功的标识
		boolean isSuccess=true;
		
		//创建文件上传对象
		DiskFileUpload disk=new DiskFileUpload();
		
		//设定上传内容的字符集
		disk.setHeaderEncoding("utf-8");
		
		//创建缓冲临时文件夹
		File tempDirectory=new File("d:/temp");
		
		if(!tempDirectory.exists())
		{
			tempDirectory.mkdir();
		}

		//设定缓冲临时文件
		disk.setRepositoryPath("d:/temp");
		
		//设定缓冲文件大小  单位字节
		disk.setSizeThreshold(1024*10);
		
		//设置上传文件大小
		disk.setSizeMax(1024*1024*100);
		String fileName="";
		List<String> list = new ArrayList<>();
		try
		{
			//读取请求对象中的输入流获取提交对象集合
			List<FileItem> fileList=disk.parseRequest(request);
			//遍历提交的对象
			for(FileItem item : fileList)
			{
				//获取上传文件的路径(仅限于file)
				//System.out.println(item.getName());
				//获取表单元素的name属性
				//System.out.println(item.getFieldName());
				//获取文件大小
				//System.out.println(item.getSize());
		
				//判断文件是否是上传对象
				//返回值true表示该元素是普通的表单元素，如：text,password,checkbox等
				//返回值false表示该元素是file文件域元素
				if(!item.isFormField())
				{
//					//上传的文件名
//					System.out.println(item.getName());
					//获取上传文件的输入流
					InputStream input=item.getInputStream();
					//获取上传文件的文件名
					fileName=item.getName();
					//设置上传路径
					String path="C:\\Users\\admin\\workspace\\APS\\WebContent\\image\\newsImages\\"+fileName;
					
					//获取输出流
					FileOutputStream output=new FileOutputStream(new File(path));
					
					int data;
					
					while((data=input.read())!=-1)
					{
						output.write(data);
					}
					
					output.flush();
					output.close();
					input.close();
					
				}
				else{
					//获取字符串形式的文件内容  非表单元素通过该方法获取表单元素的值
					//System.out.println(item.getString());
					//文本框中文乱码需要重构字符串
					list.add(new String(item.getString("iso-8859-1").getBytes("iso-8859-1"),"utf-8"));
				}
				
			}
			
			
		} catch (FileUploadException e)
		{
			isSuccess=false;
			
			request.setAttribute("error", e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (Exception e)
		{
			isSuccess=false;
			
			request.setAttribute("error", e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(isSuccess){	
			//获取请求传入的令牌
			String token = list.get(2);
			//获取session中的原始令牌
			Object serverToken = request.getSession().getAttribute(Token.TOKEN);
			if(serverToken != null && token.equals(serverToken.toString())){
				Association ass = new Association();
				ass.setA_Title(list.get(0));
				ass.setA_Image(fileName);
				ass.setA_content(list.get(1));
				associationService.addAssociation(ass);
				request.getSession().removeAttribute(Token.TOKEN);
			}
			map.put("success", "添加成功");
		}else{
			map.put("success", "添加失败");
		}
		return "page/manage";
	}
	
	@RequestMapping("upload2")
	public String upload2(HttpServletRequest request, HttpServletResponse response,ModelMap map) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		//是否上传成功的标识
		boolean isSuccess=true;
		
		//创建文件上传对象
		DiskFileUpload disk=new DiskFileUpload();
		
		//设定上传内容的字符集
		disk.setHeaderEncoding("utf-8");
		
		//创建缓冲临时文件夹
		File tempDirectory=new File("d:/temp");
		
		if(!tempDirectory.exists())
		{
			tempDirectory.mkdir();
		}

		//设定缓冲临时文件
		disk.setRepositoryPath("d:/temp");
		
		//设定缓冲文件大小  单位字节
		disk.setSizeThreshold(1024*10);
		
		//设置上传文件大小
		disk.setSizeMax(1024*1024*100);
		String fileName="";
		List<String> list = new ArrayList<>();
		try
		{
			//读取请求对象中的输入流获取提交对象集合
			List<FileItem> fileList=disk.parseRequest(request);
			//遍历提交的对象
			for(FileItem item : fileList)
			{
				//获取上传文件的路径(仅限于file)
				//System.out.println(item.getName());
				//获取表单元素的name属性
				//System.out.println(item.getFieldName());
				//获取文件大小
				//System.out.println(item.getSize());
		
				//判断文件是否是上传对象
				//返回值true表示该元素是普通的表单元素，如：text,password,checkbox等
				//返回值false表示该元素是file文件域元素
				if(!item.isFormField())
				{
//					//上传的文件名
//					System.out.println(item.getName());
					//获取上传文件的输入流
					InputStream input=item.getInputStream();
					//获取上传文件的文件名
					fileName=item.getName();
					//设置上传路径
					String path="C:\\Users\\admin\\workspace\\APS\\WebContent\\image\\animal\\"+fileName;
					
					//获取输出流
					FileOutputStream output=new FileOutputStream(new File(path));
					
					int data;
					
					while((data=input.read())!=-1)
					{
						output.write(data);
					}
					
					output.flush();
					output.close();
					input.close();
					
				}
				else{
					//获取字符串形式的文件内容  非表单元素通过该方法获取表单元素的值
					//System.out.println(item.getString());
					//文本框中文乱码需要重构字符串
					list.add(new String(item.getString("iso-8859-1").getBytes("iso-8859-1"),"utf-8"));
				}
				
			}
			
			
		} catch (FileUploadException e)
		{
			isSuccess=false;
			
			request.setAttribute("error", e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (Exception e)
		{
			isSuccess=false;
			
			request.setAttribute("error", e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(isSuccess)
		{
			//获取请求传入的令牌
			String token = list.get(6);
			//获取session中的原始令牌
			Object serverToken = request.getSession().getAttribute(Token.TOKEN);
			if(serverToken != null && token.equals(serverToken.toString())){
				Animal animal = new Animal();
				animal.setName(list.get(0));
				animal.setTypeName(list.get(1));
				animal.setVarietyId(Integer.parseInt(list.get(2)));
				animal.setAge(Integer.parseInt(list.get(3)));
				animal.setSex(list.get(4));
				animal.setIntroduction(list.get(5));
				animal.setPicture(fileName);
				animalService.addAnimal(animal);
				request.getSession().removeAttribute(Token.TOKEN);
			}
			map.put("success", "添加成功");
		}else{
			map.put("success", "添加失败");
		}
		return "page/manage";
	}
}
