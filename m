Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602866;
	b=TFjYBKU15dyx/RPwHy/g3UIp4w8CWwD7gfWKIC0sdYi/iwtDZarEmVw/2Ky5RY5IVuan
	 FBbDTyL7cJO61rys+j2gJX82pwD3MY5eCcMlCngQ3TA5+/JcAM8NGEygh74ZgiLwO9o76
	 DeSOlNhlV1B+2paqO71jXlAlFetu5CpcQoPSmVSzfv0/OGexgkrsLdO05r9w4rqmRCYF8
	 dyZYkQjCRwxlnqb1h1C3PU5V6RgBaXkT5yhsBOxnNGB34nPU58HjSI+Qir22A2/S+VjUY
	 Q3SH2I6LYYH66eKZw0b7i/bZIfHICjW+WQLvriMto7iQQ/COI/QMstEZG+FdekrJnMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602866;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qSCLUYfxv0YxlcMWt1/YlAznD3EieJ6zKQzwGjLFTsQ=;
	b=KGtsgH1Ik4mClkAL4PtxlOIunbEk2YlpYhfFHgJj0Tav4Yxvjcl6kV66Adb06XITToxp
	 57m1k79L6va39FjJUJG6JTDbBFpc//bK94mYHzPXPz+PeTbIjqj9VU3UmY/Ae9B5z/OLa
	 xgsNLJqEh5b9iW5kDt1LDL5r37M3OfUsWS0e87+Cfn+nOdJT5ubCS/zhW9mXQg14YWKFx
	 8dcjOba3/BYYawpq2i1IgoUif1ReslRbhZEi28FKeQQBQFeFlBWBSWqrwRNN2Prj2LXi8
	 4EhS360Qrz+cV+rERcEhJbMaob1wiC77/7w63VXWh6t5tYVxUW3HrcHqSfxR1WOlPLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NodoeaJz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73816606A323;
	Fri, 13 Nov 2026 20:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73816606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NodoeaJz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1sZYt6dhz8yg2ZFoH5dUYZK++dvljQWKuLtIUKkYrae0eoPu42jQfDBo+Z16101xQF0qKMgL/h98TOUKlXFBqoyuOGJSjmVvksgUtSomdciUUMZPRxEr1+QvqwVy2xwhVba+tFi2L+iRitWCA/IyjfwS9Plm7jZ5tGSdpPxUPTlJJ/du0ZNAKkfpbKqNKFb9g1PVl7f/9KYXock/0R9dpMvpAboxKiovYWpFceiNu/oQks5g+I16lEQwwU0XRlG/dbi92zKujd01nQbKYaMpSs3qZmrsdf5oJrl75H1hJXiAE+Zk6ftNBpdPZT6yWrO8FDHR7xAvlKXJ2iWkppMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSCLUYfxv0YxlcMWt1/YlAznD3EieJ6zKQzwGjLFTsQ=;
 b=VBnBBGQTUBK/Wmc8dhVLm33pucrLyXbI92MSjcVsDZMVHGuoLjr2H9yvAs23G/lmGHgbVTdGYDKqa1zd71pGwJoIvPgbPfIZ+bgtG/rUZaKPWdf9RHux/k4PYEjfTMlF5vIOyYcgfD6S/npuVVeyGvHU9bVKY+JEIclCxaVaqhuYcrqToXklOtNvzkUL5IOeICdhfkmIjC2uF2ec1fWebXlsinAsc488Q1dbBMtwXbdGySyfyPpFwbAVaOS8Njc0ndvN6GDHpPsSYSpUPCleeXyMJHLbML9UBFT0ZK9oK8o0BFhapwml6fm9p4c+LwWBdMBTpMpktMktoy6MC24bCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSCLUYfxv0YxlcMWt1/YlAznD3EieJ6zKQzwGjLFTsQ=;
 b=NodoeaJzZfODZanmyk8CJ4tRbH2AIKPdHgkxxu9YA5S8PDno593TccqlUioX0HWWLQWk9DmIJgFGteO48+aIB/VLluQVjmSNLbxwR3nAXfalb50cQlJmFDVmbbBheNQtuInHoKoc1PaoTvizZ2UW8QF6AfjEjTAED4R8EAu/y0q1lzx4b666i9xQ/orwGQbiWApraVIiEQsFNWEP7GovVCkhSuC3FLkSNRk05OmRBrtbeokbkwAqiKarfnepp7rTzpt8zvHApSfwqqaXSCD7iRLa5nwRNpy0z2kjByVJPEfihsbQcO1/2xKDFY4bFtVRrGIEBP6GdssDEppe2EfN1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 20:47:39 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:47:38 +0000
Date: Fri, 13 Nov 2026 15:47:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Allen Pais <allen.lkml@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] dmaengine: mmp_tdma: Release IRQs before channel
 tasklets and storage
Message-ID: <avd3ZIw9mqQ2p9j6@lizhi-Precision-Tower-5810>
References: <20261011202406.1869441-1-mhun512@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011202406.1869441-1-mhun512@gmail.com>
X-ClientProxiedBy: DS7PR06CA0018.namprd06.prod.outlook.com (2603:10b6:8:2a::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 340de2a1-9d1c-4e85-fe36-08df41c75ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|18002099003|10067099003|22082099003|3023799007|6133799003|11063799006|5023799004|56012099006|261021121427099003|261102123227099003|260925021911599003|261026121527099003|261028144727099003|261021123027099003|261009223027099003|261022105027099003|260925022911599003|261026140227099003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	OsDTyyT3FcbXlI404KKt15w33RKgx4qzMmyFn1HIpDkflUwPrPl55WEAfM2uJoAuZXJy8hhB5T/Koqj0sj4QnRmhXoASqs/NoQqYwc7VZWb77DMQ0eW1AnX+h4Aso+P6NewrHGY6k7BXiH7yTt5qtvyLp+ZWk0TbCxhEV7OGJpbn2X4ZdcytZKFurmfb13vG3f1X0WIKRgLOb/0DUg+r9HrkuJ645Q7yVfLT7z0V76cG32p0MVAVseYmoCZZrABZS+C4iwqoLWTmdgUzVaxCb1ufkwo0gwPBwjDQoNQqNNb8sXqMCLAFWEqdiayOzjfQuRQ9IGAS4yf2W0qA7+TcgXeyiKzQkenwmqX9gZAIuzIr5+DLkt0N6hSg7mXApXdfAbaVEWnpsNJDCtlLwgMn856rmB1lEaz6gt+IcLB0pZBBDF2bnZ4BtoAsnfnz+oll6MHgjomnUFbjPC9nDhDk73FYMHmkDMNxGodtn34kd5nAwgQDlOIc+7MBTuJXZcscfs+XFoi7gPkdimalVFTq+dc+QZ73mYXKyvPmKTEylUpPJuJ6q9MYJQJkKm4wGmRa8uYMZfdRLBcfFK1rJLwvYaAr3qGfxDw3Tdfg3eUEj7yXWU6TuM6B+m5etUuObVaD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(18002099003)(10067099003)(22082099003)(3023799007)(6133799003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261102123227099003)(260925021911599003)(261026121527099003)(261028144727099003)(261021123027099003)(261009223027099003)(261022105027099003)(260925022911599003)(261026140227099003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L1ZHJ60fF+FJodhp4lFpwm7ER62cD+vD668Hyrlcrb13G3bOqQGlXtGZpB2j?=
 =?us-ascii?Q?6qrQIsotZ5EdIepTww5+3S5OOIlQAQJv1s0Ivz386L8tidomr1ItD2MZl8mf?=
 =?us-ascii?Q?8xeygjDTGXKUGWunQ+SlYVzsiW+MCHau6SC6nBSxt93GPc8t0tbuPs936s28?=
 =?us-ascii?Q?FU21BCzWAECJD+GRb0jh3s7SxNdCPCde6a1/wOJtClDd1XlTL5mhP3xWF60v?=
 =?us-ascii?Q?aze8hy12nSoan9UHRC3uxO15okxdMwbqaPdG8X2gTQPYvKYvJik5KW2IxWkZ?=
 =?us-ascii?Q?ly94yIuQIsyYtDWt7n7Nbo4rhmHaLmnNkVAqbufL12wMaTUh60laYRTOcjb4?=
 =?us-ascii?Q?2qbf+KHYezjw7C6R/qRaN5zzrkUv+/dn/Ah/OLAY5XG1/7VPDm/xlH/jfegD?=
 =?us-ascii?Q?ZQ6LDGCcksQM+6H3/i0k4XQ5NWZ50h4073S6vfK+cd0lb9yScNJboM3RMP1c?=
 =?us-ascii?Q?msDIA99yt1CtW77uTCBXXbQ8sDSw3GsUNtAkydOMLH9F0NDZqUX0FnBdONHP?=
 =?us-ascii?Q?wv8iA/6Cr44hd3v1XgHAMAo5cILRhzy2IpD/OHvY/N0BmLWqo+6W9bnhLbBc?=
 =?us-ascii?Q?VZXL/ZD7KzwPgkXKHQ2rkjLkvqggh4Uwpm317K2Nfw8VnxaqnF74y/iKmME3?=
 =?us-ascii?Q?2vntZu3jlO8aMSJAr8mY8LWIQCaGv/jE835RDtCUiVJddQl9zHYdNsGUG+Gg?=
 =?us-ascii?Q?LHNcbVUwmiI8jlTwChb2lP28DBforVT8cB2wb+ioXiDB3/EqCywWWG9bF+2k?=
 =?us-ascii?Q?vfOiMkq7arp+oN//vxbgNY8xDapSc/M16+V1MF+rfCfoC8oGVc58bKVBqtIA?=
 =?us-ascii?Q?uzer67z4ZWCPtH0hP8SIeaofQhjBiOevL0GdRgpVVQarJyOr2sdw+63whm+N?=
 =?us-ascii?Q?gksAHoFSQ5HbBMzajgBahznnvRswzcY+luhUBUR1RQT8rLfkNiwg2pg9NWGD?=
 =?us-ascii?Q?UA9E01RNBSVCN6tXTe3DzvN8OnCEcJVnwsx6Krwq2eHZOxMRX+sZKkfWykOy?=
 =?us-ascii?Q?V0mnbLNXmz5NizYtfzylNpj9vs7kh+nKm2x0P1I5MPB+aN+aFh7faOY144CB?=
 =?us-ascii?Q?peZewwmEpU6sY2tQilzS2P3k8i/cFa7M/C4BM2+kzywLqzUWiWHp7+CgYKBT?=
 =?us-ascii?Q?zrS1+y6e9NvB1Yam+4WdjcsycKh5Lr2OUNRE419h/7oR3eRpM5PXMzxJh2Km?=
 =?us-ascii?Q?5pxz+VodUAxKk4mCsxfRqT1hH7wdwnG9VA76RWYHaMY35zNHtrGbtKHvIWgM?=
 =?us-ascii?Q?jzST5F72y93yAZIsH+s3t07DUIzHHvNEgFfSOL3TDprulJfY/Dqz0QhtqGuG?=
 =?us-ascii?Q?byxRX9Q+mG5LvK+sSM6Vw5o1bl6VKRCCPQiT6Ckh5yTA8N8VR0n1bzsBpKJX?=
 =?us-ascii?Q?fKLmuXpwXtfx66FruF8pdeI1+K0KisbxOZfsRjp32PBdDPBZ2hGdCWVkTFK+?=
 =?us-ascii?Q?SP3gM5XYn26itfoj4f1x6XyeV2TbSCL8KkdPt8DhWqGLOHmZLuo3ozQivgLA?=
 =?us-ascii?Q?x0sfPzZaSV3o3xqwgVX8+vNSC6g8ANW46coZsCs215ZcXX81GL+etUGbh5du?=
 =?us-ascii?Q?KntPmpKKRvPi/RfSD9MT9OPc6VLPUoPiIXGohIqJh+yq1pSz0hKEwyL4QUOz?=
 =?us-ascii?Q?2dgRM4B7FFYfodRg+x2tCG6zL4EYwHFwakRqw1SjignooirEL+LuevTioAKQ?=
 =?us-ascii?Q?hOMQMK3WD0Chpi86sQvYwAn9ggx7ufU/qbcgAEpjGcU/+8IwJK1arxvgwC0T?=
 =?us-ascii?Q?Rb/2sc1NWBhh0fBEqpfLcV/n6cfjMJM8mOh/EHTAw7x5AYWFQkcc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340de2a1-9d1c-4e85-fe36-08df41c75ac7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:47:38.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X8os/mMqVE2xV8+HFILwIDvYgAcnUODywOkJ3H/BMVkSS6T02SUdNOvMYQGCws+4q8H1UahqHKyYxDt0mHnqCtB04sdo2AGHIIyfsJivY04ZBIPKdrI82BCy48FYc4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713

On Sun, Oct 11, 2026 at 04:24:06PM -0400, Myeonghun Pak wrote:
> The shared IRQ is requested before the channels are initialized and
> released after their storage is freed. Its handler can therefore
> dereference NULL pointers or freed channel state. Pending tasklets can
> also outlive the channels.
>
> Initialize both channels before requesting the shared IRQ and add managed
> tasklet cleanup for each channel. This releases IRQs before draining each
> tasklet and freeing its channel storage.
>
> This issue was found by static analysis.
>
> Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
> Assisted-by: LLM

This tag already removed.

> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Compile-tested with GCC, W=1 (arm). No runtime testing.
>
> This fix overlaps with Allen Pais's DMAengine BH v3 conversion. If that
> series lands first, the cleanup should use dmaengine_kill_bh().
> Link: https://lore.kernel.org/r/3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com/
>
>  drivers/dma/mmp_tdma.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321..965cdd6 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -353,6 +353,13 @@ static void dma_do_tasklet(struct tasklet_struct *t)
>  	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
>  }
>
> +static void mmp_tdma_kill_tasklet(void *data)
> +{
> +	struct mmp_tdma_chan *tdmac = data;
> +
> +	tasklet_kill(&tdmac->tasklet);
> +}
> +
>  static void mmp_tdma_free_descriptor(struct mmp_tdma_chan *tdmac)
>  {
>  	struct gen_pool *gpool;
> @@ -562,6 +569,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>  					int type, struct gen_pool *pool)
>  {
>  	struct mmp_tdma_chan *tdmac;
> +	int ret;
>
>  	if (idx >= TDMA_CHANNEL_NUM) {
>  		dev_err(tdev->dev, "too many channels for device!\n");
> @@ -584,6 +592,9 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>  	tdmac->status = DMA_COMPLETE;
>  	tdev->tdmac[tdmac->idx] = tdmac;
>  	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +	ret = devm_add_action_or_reset(tdev->dev, mmp_tdma_kill_tasklet, tdmac);
> +	if (ret)
> +		return ret;
>
>  	/* add the channel to tdma_chan list */
>  	list_add_tail(&tdmac->chan.device_node,
> @@ -666,14 +677,6 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>
> -	if (irq_num != chan_num) {
> -		irq = platform_get_irq(pdev, 0);
> -		ret = devm_request_irq(&pdev->dev, irq,
> -			mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/* initialize channel parameters */
>  	for (i = 0; i < chan_num; i++) {
>  		irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
> @@ -682,6 +685,15 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>
> +	/* Release the shared IRQ before draining and freeing the channels. */
> +	if (irq_num != chan_num) {
> +		irq = platform_get_irq(pdev, 0);
> +		ret = devm_request_irq(&pdev->dev, irq, mmp_tdma_int_handler,
> +				       IRQF_SHARED, "tdma", tdev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	dma_cap_set(DMA_SLAVE, tdev->device.cap_mask);
>  	dma_cap_set(DMA_CYCLIC, tdev->device.cap_mask);
>  	tdev->device.dev = &pdev->dev;
