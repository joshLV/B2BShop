package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.weipu.AdvertisingImage;
import net.deepdragon.service.weipu.AdvertisingImageService;
import net.deepdragon.service.weipu.CarouselAdvertisingService;
import net.deepdragon.weipu.Global;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 广告相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "AdController")
@RequestMapping(Global.MALL_PATH + "/ad")
public class AdController extends BaseMallController {
	
	@Resource
	private AdvertisingImageService advertisingImageService;
    @Resource
    private CarouselAdvertisingService carouselAdvertisingService;
	
	@RequestMapping(value = "")
	@ResponseBody
	public Object index( String sign,Integer size) {
        String info = "获取图片信息数据页面";
        Map<String, Object> result = new HashMap<String, Object>();
		try {
            List<AdvertisingImage> advertisingImages=advertisingImageService.getAds(getParamMap(),sign,size);
            result.put("imgs", advertisingImages);
            return result;
        } catch (Exception ex) {
            logger.error(info + "时，发生异常", ex);
        }
		return null;
	}

}
