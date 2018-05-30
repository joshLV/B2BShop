package net.deepdragon.util;

import net.deepdragon.bean.Pager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Explain:
 * FileName:
 * Author: TianYu
 * Time: 2016-04-07 14:31
 * Desc:
 * Version: V1.0
 */
public class SearchSQL {
    /** ec查询列 */
    private static String ecColumn = "concat(g.id,'') id,g.tenantId,concat(g.categoryId,'') categoryId,/**g.categoryPath,g.brandId,*/concat(g.shopId,'') shopId,g.productId,g.name,/**g.sn,*/g.shortName,g.barcode,/**g.phoneShopNo,*/g.fullName,g.price,/**g.erpPkCode,g.SupCode,g.cost,g.spec,*/g.marketPrice,/**g.isMemberPrice,*/g.unit,/**g.weight,g.adwords,g.image,*/g.stock,/**g.stockMemo,g.point,g.defaultPrice,g.isMarketable,g.isTop,g.isList,g.isGift,g.isLianYing,g.introduction,g.keywords,g.hits,g.weekHits,g.weekHitsDate,g.monthHits,g.monthHitsDate,*/g.sales,/**g.weekSales,g.weekSalesDate,g.monthSales,g.monthSalesDate,*/g.scoreCount,/**g.scoreTotal,g.score,g.becScoreCount,g.becScoreTotal,g.becScore,g.isIndex,g.indexOrder,g.description,g.createUser,g.createDate,g.modifyUser,g.modifyDate,g.status,g.isDelete,g.shippingOrderUrl,g.scoreSet,g.platform,g.predictDay,g.supplierId,g.type,g.checkDate,*/g.hasRebate/**g.startNum,g.limitNum,g.packageModulus,g.packageUnit,g.packageBarCode,g.phoneIntroduction,g.enableBatchPrice,g.isPost,*/";
    /** bec查询列 */
    private static String becColumn = "concat(g.id,'') id,g.tenantId,/**g.categoryId,g.categoryPath,g.brandId,*/concat(g.shopId,'') shopId,/**g.productId,*/g.name,/**g.sn,*/g.shortName,g.barcode,/**g.phoneShopNo,*/g.fullName,g.price,/**g.erpPkCode,g.SupCode,g.cost,g.spec,*/g.marketPrice,/**g.isMemberPrice,*/g.unit,/**g.weight,g.adwords,g.image,*/g.stock,/**g.stockMemo,g.point,*/g.defaultPrice,/**g.isMarketable,g.isTop,g.isList,g.isGift,g.isLianYing,g.introduction,g.keywords,g.hits,g.weekHits,g.weekHitsDate,g.monthHits,g.monthHitsDate,*/g.sales,/**g.weekSales,g.weekSalesDate,g.monthSales,g.monthSalesDate,g.scoreCount,g.scoreTotal,g.score,*/g.becScoreCount,/**g.becScoreTotal,g.becScore,g.isIndex,g.indexOrder,g.description,g.createUser,g.createDate,g.modifyUser,g.modifyDate,g.status,g.isDelete,g.shippingOrderUrl,g.scoreSet,g.platform,g.predictDay,g.supplierId,g.type,g.checkDate,*/g.hasRebate,g.startNum,g.limitNum,g.packageModulus,g.packageUnit,g.packageBarCode,g.phoneIntroduction,g.enableBatchPrice/**g.isPost,*/";

    private static Logger logger = LoggerFactory.getLogger(SearchSQL.class);

    /**
     * 获取bec查询SQL
     * @param keywords
     * @param pager
     * @return
     */
    public static String getBecSearchSql(String keywords, Pager pager){
        StringBuffer sql = new StringBuffer();

        sql.append(" select ");
        sql.append("             goods.*, '' AS pic, ");
        sql.append("             IFNULL(c.maxBatchPrice,price)  maxBatchPrice, ");
        sql.append("             IFNULL(c.minBatchPrice,price)  minBatchPrice, ");
        sql.append("             concat(c.minBatchPrice,'~',c.maxBatchPrice) batchPrice, ");
        sql.append("             ifnull(c.startBatchNum, 1) startBatchNum, ");
        sql.append("             mm.name shopName ");
        sql.append("         FROM ");
        sql.append("         ( ");
        sql.append("             SELECT ");
        sql.append(becColumn);
        sql.append("             FROM ");
        sql.append("               wp_goods g, wp_catelog c ");
        sql.append("             WHERE g.categoryId = c.id ");
        sql.append("                 AND g. STATUS = 5 ");
        sql.append("                 AND g.isDelete = 1 ");
        sql.append("                 AND g.isMarketable = 1 ");
        sql.append("                 AND g.platform >= 2 ");
        sql.append("                 AND g.type = 0 ");
        sql.append("                 AND c.enabled=1 ");
        sql.append("                 and ");
        sql.append("                     (g.name like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or g.fullName like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or g.keywords like concat('%','").append(keywords).append("','%') ");
        sql.append("                     OR g.barcode like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or g.packageBarCode like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or c.name like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or c.sign like concat('%','").append(keywords).append("','%') ");
        sql.append("                     ) ");
        sql.append("  ");
        sql.append("             UNION ");
        sql.append("  ");
        sql.append("             select ");
        sql.append(becColumn);
        sql.append("             from wp_goods g,wp_goods_brand b ");
        sql.append("             where g.brandId = b.id");
        sql.append("                 AND g. STATUS = 5 ");
        sql.append("                 AND g.isDelete = 1 ");
        sql.append("                 AND g.isMarketable = 1 ");
        sql.append("                 AND g.platform >= 2 ");
        sql.append("                 AND g.type = 0 ");
        sql.append("                 AND b.enabled=1 ");
        sql.append("                 and ");
        sql.append("                     (b.name like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or b.sign like concat('%','").append(keywords).append("','%') ");
        sql.append("                     or b.description like concat('%','").append(keywords).append("','%') ");
        sql.append("                     ) ");
        sql.append("  ");
        sql.append("             UNION ");
        sql.append("  ");
        sql.append("             select ");
        sql.append(becColumn);
        sql.append("             from wp_goods g ");
        sql.append("                   INNER JOIN ");
        sql.append("                         (SELECT ");
        sql.append("                             t.goodsId AS goodsId, ");
        sql.append("                             group_concat(w.name SEPARATOR ' | ') AS tagname ");
        sql.append("                         FROM ");
        sql.append("                             wp_goods_tag t ");
        sql.append("                             LEFT JOIN (select id, name FROM wp_tag) w ON t.tagId = w.id ");
        sql.append("                         GROUP BY ");
        sql.append("                             t.goodsId ");
        sql.append("                         ) tag ");
        sql.append("                   on g.id = tag.goodsId ");
        sql.append("             where ");
        sql.append("                 g. STATUS = 5 ");
        sql.append("                 AND g.isDelete = 1 ");
        sql.append("                 AND g.isMarketable = 1 ");
        sql.append("                 AND g.platform >= 2 ");
        sql.append("                 AND g.type = 0 ");
        sql.append("                 and tag.tagname like concat('%','").append(keywords).append("','%') ");
        sql.append("  ");
        sql.append("             UNION ");
        sql.append("  ");
        sql.append("             select ");
        sql.append(becColumn);
        sql.append("             from wp_goods g ");
        sql.append("                 INNER join ( ");
        sql.append("                     SELECT ");
        sql.append("                         gpd.goodsId AS goodsId, ");
        sql.append("                         group_concat(gpd.content SEPARATOR ' | ') AS paramecontent ");
        sql.append("                     FROM ");
        sql.append("                         wp_goods_parameter_detail gpd ");
        sql.append("                         left JOIN ");
        sql.append("                             (select p.id,p.name from wp_goods_parameter p LEFT JOIN wp_goods_parameter_group g on p.groupId=g.id where g.enabled=1) gp ");
        sql.append("                         on gpd.parameterId = gp.id ");
        sql.append("                     GROUP BY ");
        sql.append("                     gpd.goodsId ");
        sql.append("                 ) param ");
        sql.append("                 on g.id = param.goodsId ");
        sql.append("             where ");
        sql.append("                 g. STATUS = 5 ");
        sql.append("                 AND g.isDelete = 1 ");
        sql.append("                 AND g.isMarketable = 1 ");
        sql.append("                 AND g.platform >= 2 ");
        sql.append("                 AND g.type = 0 ");
        sql.append("                 and param.paramecontent like concat('%','").append(keywords).append("','%') ");
        sql.append("         ) goods ");
        /*sql.append("             LEFT JOIN ( ");
        sql.append("                 SELECT ");
        sql.append("                     goodsId, ");
        sql.append("                     concat((SELECT setvalue FROM shared_system_set WHERE setKey = 'imageUrl'),groupName, '/', url) image ");
        sql.append("                 FROM ");
        sql.append("                     wp_goods_images ");
        sql.append("                 GROUP BY ");
        sql.append("                     goodsId ");
        sql.append("             ) img ON img.goodsId = goods.id ");*/
        sql.append("             LEFT JOIN ( ");
        sql.append("                 SELECT bgp.goodsId, max(bgp.batchPrice) maxBatchPrice, min(bgp.batchPrice) minBatchPrice,min(bgp.startBatchNum) startBatchNum ");
        sql.append("                 FROM b2b_goods_price bgp ");
        sql.append("                 GROUP BY bgp.goodsId ");
        sql.append("                 ORDER BY bgp.goodsId ASC ");
        sql.append("                 ) c ON (c.goodsId = goods.id and goods.enableBatchPrice = 1) ");
        sql.append("             LEFT JOIN ");
        sql.append("                 ( ");
        sql.append("                 SELECT m.name,m.id FROM wp_merchant m ");
        sql.append("                 ) mm ");
        sql.append("             ON goods.shopId = mm.id ");

        sql = installOrder(sql, pager, null);

        logger.debug(sql.toString());

        return sql.toString();
    }

    /**
     * 获取ec查询SQL
     * @param keywords
     * @param pager
     * @return
     */
    public static String getEcSearchSql(String keywords, Pager pager, String groupBy){
        StringBuffer sql = new StringBuffer();

        sql.append(" SELECT ");
        sql.append("     goods.*, img.image AS pic ");
        sql.append(" FROM ");
        sql.append("     ( ");
        sql.append("         SELECT ");
        sql.append(ecColumn);
        sql.append("         FROM ");
        sql.append("             wp_goods g, wp_catelog c ");
        sql.append("         WHERE g.categoryId = c.id ");
        sql.append("         AND g. STATUS = 5 ");
        sql.append("         AND g.isDelete = 1 ");
        sql.append("         AND g.isMarketable = 1 ");
        sql.append("         AND g.platform <= 2 ");
        sql.append("         AND g.type = 0 ");
        sql.append("         AND c.enabled = 1 ");
        sql.append("         AND ( ");
        sql.append("             g. NAME LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             OR g.fullName LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             OR g.keywords LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             OR g.barcode LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             OR g.packageBarCode LIKE concat('%', '").append(keywords).append("','%') ");
        sql.append("             OR c. NAME LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             OR c.sign LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("         ) ");
        sql.append("         UNION ");
        sql.append("             SELECT ");
        sql.append(ecColumn);
        sql.append("             FROM ");
        sql.append("                 wp_goods g ,wp_goods_brand b");
        sql.append("             WHERE g.brandId = b.id");
        sql.append("             AND g. STATUS = 5 ");
        sql.append("             AND g.isDelete = 1 ");
        sql.append("             AND g.isMarketable = 1 ");
        sql.append("             AND g.platform <= 2 ");
        sql.append("             AND g.type = 0 ");
        sql.append("             AND b.enabled = 1 ");
        sql.append("             AND ( ");
        sql.append("                 b. NAME LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("                 OR b.sign LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("                 OR b.description LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("             ) ");
        sql.append("             UNION ");
        sql.append("                 SELECT ");
        sql.append(ecColumn);
        sql.append("                 FROM ");
        sql.append("                     wp_goods g ");
        sql.append("                 INNER JOIN ( ");
        sql.append("                     SELECT ");
        sql.append("                         t.goodsId AS goodsId, ");
        sql.append("                         group_concat(w. NAME SEPARATOR ' | ') AS tagname ");
        sql.append("                     FROM ");
        sql.append("                         wp_goods_tag t ");
        sql.append("                     LEFT JOIN (SELECT id, NAME FROM wp_tag) w ON t.tagId = w.id ");
        sql.append("                     GROUP BY ");
        sql.append("                         t.goodsId ");
        sql.append("                 ) tag ON g.id = tag.goodsId ");
        sql.append("                 WHERE ");
        sql.append("                     g. STATUS = 5 ");
        sql.append("                 AND g.isDelete = 1 ");
        sql.append("                 AND g.isMarketable = 1 ");
        sql.append("                 AND g.platform <= 2 ");
        sql.append("                 AND g.type = 0 ");
        sql.append("                 AND tag.tagname LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("                 UNION ");
        sql.append("                     SELECT ");
        sql.append(ecColumn);
        sql.append("                     FROM ");
        sql.append("                         wp_goods g ");
        sql.append("                     INNER JOIN ( ");
        sql.append("                         SELECT ");
        sql.append("                             gpd.goodsId AS goodsId, ");
        sql.append("                             group_concat(gpd.content SEPARATOR ' | ') AS paramecontent ");
        sql.append("                         FROM ");
        sql.append("                             wp_goods_parameter_detail gpd ");
        sql.append("                         LEFT JOIN ( ");
        sql.append("                             SELECT ");
        sql.append("                                 p.id, ");
        sql.append("                                 p. NAME ");
        sql.append("                             FROM ");
        sql.append("                                 wp_goods_parameter p ");
        sql.append("                             LEFT JOIN wp_goods_parameter_group g ON p.groupId = g.id ");
        sql.append("                             WHERE ");
        sql.append("                                 g.enabled = 1 ");
        sql.append("                         ) gp ON gpd.parameterId = gp.id ");
        sql.append("                         GROUP BY ");
        sql.append("                             gpd.goodsId ");
        sql.append("                     ) param ON g.id = param.goodsId ");
        sql.append("                     WHERE ");
        sql.append("                         g. STATUS = 5 ");
        sql.append("                     AND g.isDelete = 1 ");
        sql.append("                     AND g.isMarketable = 1 ");
        sql.append("                     AND g.platform <= 2 ");
        sql.append("                     AND g.type = 0 ");
        sql.append("                     AND param.paramecontent LIKE concat('%','").append(keywords).append("','%') ");
        sql.append("     ) goods ");
        sql.append(" LEFT JOIN ( ");
        sql.append("     SELECT ");
        sql.append("         goodsId, ");
        sql.append("         concat( ");
        sql.append("             ( ");
        sql.append("                 SELECT ");
        sql.append("                     setvalue ");
        sql.append("                 FROM ");
        sql.append("                     shared_system_set ");
        sql.append("                 WHERE ");
        sql.append("                     setKey = 'imageUrl' ");
        sql.append("             ), ");
        sql.append("             groupName, ");
        sql.append("             '/', ");
        sql.append("             url ");
        sql.append("         ) image ");
        sql.append("     FROM ");
        sql.append("         wp_goods_images ");
        sql.append("     GROUP BY ");
        sql.append("         goodsId ");
        sql.append(" ) img ON img.goodsId = goods.id ");


        sql = installOrder(sql, pager, groupBy);

        logger.debug(sql.toString());
        return sql.toString();
    }

    /**
     * 添加排序
     * @return
     */
    private static StringBuffer installOrder(StringBuffer sql, Pager pager, String groupBy){
        sql.insert(0, "select o.* from (");
        sql.append(" ) o ");

        if( StringUtil.isNotEmpty( groupBy )){
            sql.append( groupBy );
        }

        sql.append(" order by ").append( pager.getOrderBy() ).append(" ").append( pager.getOrderType() );

        return sql;
    }
}
