Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61A2F851;
	Thu, 16 Jul 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219437; cv=fail; b=XxNFxj8t1wBOX7yL3AawklgrkijIJXEiInpu0dxsankrst37yo675JyLe4I+HL5Ohnl/TF6ZIzUI9KzbZSPKIMlsWUVFjxKoMyXD6lxYi/jEIQfOXig+4Dz0X2s8v1JmvxbRCbL5hxkbNE3vRHxibbBE05s8edO9wOc6MOaq4pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219437; c=relaxed/simple;
	bh=56Cuxskcgy/xqp+FXgfdqQNeVKs+Jr6Xvi/y/TnyQGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sn7WR9x4vN5AiMzIGWEzAu9US3f+ntmSF8HDYjy0phpRR1KCfzdQOozCx3tAXH3oha7RkT+3PkmI6Zo0Xzz98EJvejLCtNTzVp1Qp2asQQkm68cGQUQVijVcN85vss9Vy3KbwJsnTeg8kpbKNg5DXe5ZeSqz2v1KomculJ3rT1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ppbJKgVa; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ppbJKgVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/toqgFghw4Rwly8NCbuY3j1zwhtZGd6/nF2Aic7QzmF0E/pqpKUYWDb2v8NSg94ZMuXj6dSH3P649HboWKbH3sgJchGUqICdj1i/XiOhFmql2b3IdxI778nUjaXN9vLASGp18ttynVrPbWUW1srSgeiZBe3xiAjTqQwZTQK8EkUiJ1PedR8Cdy9HtIPQXXHNO7a1PGwOwtrMSshdpYuD6SC3MIdFqlF3vPAiXGxf4KY0W/NWBoomvFsq/4YNmVDprFdKF2lSYlISeX7MD8N5gP1WnJgE/rVJ9DgmehRHr1b8WYrXbUBStqCsiympU7lZoLWiTVDsvNib5sRUrmh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cQz0V9tyiT18ZCy9wrtHM62mbO1aBtT5Gw98C8/SgM=;
 b=YrFmNW4RV3QHO+FG5X3D2WyLZUK7Re0Ha/YbGvp1Zx2JfciegIrgirELKlyZcKKOiWK8CdH017s7jxqKxBtX/LAm/xcjSU3BAEZkRGMCFja4jO7tz5IWRNlUljQBQ/BtA/M35sDmFtFTMkqQgVC4Urre4LpoyzprhtN+9m3o77jrwMFM8bbcQmHChDmgQuiS21yyS4+2AxqZLjoFJTbTnnrC/eWkF2rNEKB+pm/fcUxg+Ky4JvKKAT21WMsW9R8ll7jxKCgq8DKh3cAlXwUhVo10JRwh5eB/rBCEjyQ9YlLZ7u35YQNCWopyZYpfSRRsWGvZLNBAct3I3HCQRuooaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cQz0V9tyiT18ZCy9wrtHM62mbO1aBtT5Gw98C8/SgM=;
 b=ppbJKgVago17qC6TO5CrMkKhZxOduaEoH0OBGxxc9cymhNnTLH9p81a4YPlQh8RrKgggojingY61TOULC1OZxqjG2vxEQVy4ZhR9dy/cGSxlRwG0VB6Vu5N+lXkmvEdzG8arB39HPP5oKu5SVVGnFAQxKY3TLGpTBtqvMfHJ9C0ZlPOz+PTytnXkt6WqfPa+qP6fk1DnOCq0R8pPAiTWGO6ItN+Fc6KLhjbFBHA+Y2ICRWBKgnTj7qDXMeAuH126myeBKgF9MUIjCji3bmISbLd7BuvjQSnzYg5nYY6h3E8uMst9jhXYmy/IHEmlVwwXBortsOLg4phThPbZ/JsgYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10221.eurprd04.prod.outlook.com (2603:10a6:800:22b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 16:30:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 16:30:27 +0000
Date: Thu, 16 Jul 2026 12:30:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Message-ID: <alkHG30EQeR4VBmY@lizhi-Precision-Tower-5810>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <20260716152503.1747922-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716152503.1747922-3-den@valinux.co.jp>
X-ClientProxiedBy: PH8PR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10221:EE_
X-MS-Office365-Filtering-Correlation-Id: 147b6acf-3cb6-4bd7-c1ab-08dee3578b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|366016|1800799024|11063799006|5023799004|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rZPlmahiQNIdxv5u0BC8TaLtIaWLRfKetbO27z6xyEPHrK6AosQ4j4qR7e+T6R9VLYBLYP1QtlIFiBZwD2OLBvOR1E4ZRY5WcgryRbumKze0lLsl+puXPH/qn+ULjS3Ia6qPzpnjFJrIv9hHxUKHNaqsZIGlYKwO18MIEFsz8QByAtCHhXvNKHmgeArtZy+6VBBcqnOrB9o3t/ieTZb/xApFN0k+umcA9viaWMasiNS7+X/O+74jAcKWbuPoIVxytaH1Con3e0/xIWwaIylEOMKqTpuiznuQ8muXhG/luR1YvZwQM9WE82elX1fq0+Ggezy/QPEV9G3bG2jsQkurnykRmrhn0SSAUso0ozKPGUquq2696jpPwhL8CcX0Lp3BOiZiixexWLYtPKhcCF2WfBsibHTNX3oo53FuksVt+bvhSycyHdic3rpEvvLWuuRK0U4SswOccsJY1td4UUSfsTiAewcVq+AXWo4CRzC/P40zM3kk4DCtSmwNZvz5L+n5ss1on54lLwp41hLpcU2gQDbB0eEX+CkoiVAKDSY9AWbH0d8Sx429AKpkNO0jwFCdAV5ztqprLkhgWhAQaBMschlsf84vooEgzEaUPTVXa7CPl/gteDl9BbNkCXw1rldHVlXNW/dGdpA49QjCYGyOxRgykOs+UgkbIPVSOI6aIKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(366016)(1800799024)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jC5b1F35t9RWeTIHHzrVNikTK45OVZcmLuia2fUgueJuIIJa/iO+POpJ6oxR?=
 =?us-ascii?Q?XWqRHf+b8LjhDutf8VXjvQvMKnCDx1xKgNVYm5M6M6p0AKFeYtwBI5F8r2kO?=
 =?us-ascii?Q?JsbB6so0/JlolE3jfkTOXfAsJPuFMqCdB1/U6LDwvBGj6PqlOVoBdGzfzhZQ?=
 =?us-ascii?Q?9lIwD03qwOlJZKopS8NyTYpX3hNdE/ypdCRkgH4lv2G1gw4fFIBtsrjRV0yO?=
 =?us-ascii?Q?fMmtJeslsMDdPDm2cDhIa5QhtReiYSJS8XiFuTsEN2IuuVaMEcR2vn4NnW7Y?=
 =?us-ascii?Q?cVnPeb5YsnWlZQUiQWYoGqxJvv6xhgNldmfZGaZLHo2DH9tRse7EwntLYhak?=
 =?us-ascii?Q?ou54374/ro17zmhW9lT2CCCGKXDl2rGSk1CqOT+ONypCUsuNCpzuz2EMLfQf?=
 =?us-ascii?Q?CGWAZnJ+8skqWMH841vX7DSG0GjgChO8sFIBpDGmK9IFPZHZDBDdhaT5eP02?=
 =?us-ascii?Q?G+B4WDAVeOETgDEQjfnpBY674FB8HJ0InTtoPsThvLazchno00qqu8CCpr9W?=
 =?us-ascii?Q?C2rRVV9gUBevC/+7ha47iUH4vLshLebl2/oauEPVnyUWMUP1d8/6ulfeDpnC?=
 =?us-ascii?Q?wtP1kDMnZK6YfyATk6CimkOT7IfH/u32bsPPDV6AKSDNOJzXJiMAaqTQ2yE+?=
 =?us-ascii?Q?1zeb+XqMGFYhShFLYf2xd3h8FU7qDWWrdVNuwgRqEwrTAxiYmQhoiY4DUh2U?=
 =?us-ascii?Q?Qj0DdmQayl11meeWXv7dUJF345qXVEz6/VCWY/aFlqJvYIafuRrESodBATP+?=
 =?us-ascii?Q?8pzVKbjsaC6UPaBB0LJNlBKExzTyMnWTn45UZ4Yqq1NIiGhYwK2LNNPIbhuB?=
 =?us-ascii?Q?zfWT31Ed2LSvc5LzQjOz8+nQzICr7F65Q4FzzF8zcDnNQubisyZeHMVKzZEB?=
 =?us-ascii?Q?ul4IcdK2gw94jmpVjom1xL69R23OZ6l4BbQm9gFQaIII/zhgVHGSk7rUL2gL?=
 =?us-ascii?Q?RK2iuf5UQ8NuOEb4QNglBVfHX6D6mV1Xn6AGNXLjfazsLC0DPAQQLh/yLYL5?=
 =?us-ascii?Q?bD5ChDQJ81l/LUcQaRG0HIhkzzghEmVmbqPbTn9pF6HBoA81G1GRirvOYMgt?=
 =?us-ascii?Q?Fdtyzas6YD5uCR5hNwhWZZai1FJFgXUx9bwdMDt8qyuyuF3oMqGw5E32EYrk?=
 =?us-ascii?Q?VtxuqOLfwFmcFuS6I+iJpfPzKJRtidUd5NXDQjDZlpJxU6B91JdTz3w53KNC?=
 =?us-ascii?Q?sYAFLP7VzuMr8LzhQU2OAQ53s0fRWl/P+6snW4PHNAwoxULJhONoEmmdybWu?=
 =?us-ascii?Q?uT0gGAX493MemKXelaF9bw4kuhCGIvACsq+5lbsjcO3L3gA+xm+yNCd0NG2K?=
 =?us-ascii?Q?6hscWKni6/I9LymTUbfnUeXebCEt6n6pU11E/D5IANBh/a+bCrgqPGX9YZ6N?=
 =?us-ascii?Q?lsBDKOKWjbICA1XJ0eNQmLAMo91BjW2l3BZ3xlZ/0kpyIgtIyMZwMe/FRWcA?=
 =?us-ascii?Q?Ej94gr9DU+TikuYE9MRJevk3R0s30vIWag3hWYVM2WiFZp+q6xEE7kdsRpdO?=
 =?us-ascii?Q?2cPP44U74dIHE9+zd7tXtbgJXD2stfye+kfVbRcTcA6AlbkDUKtobO5aOuoz?=
 =?us-ascii?Q?ci8IdBk6pQUKZ8jGwZFcaEPpZFmqzZbA/iPAkqzq09cEFwd4RJ+zchQXm4m4?=
 =?us-ascii?Q?MWNESlPh0tzzq47OlL8YkWZtbt0XQRLSGlEX8v1ZhDVzQCo682lvbvOdaSmq?=
 =?us-ascii?Q?ICELN4pJ2nT1jCm7G/MaTFJ+IrpMZjYQWioJOF0oemv0GwGQJzqdEucrGGWG?=
 =?us-ascii?Q?Iuo/ov+PUFWA7zE2jTiARSc4icDCT59+argYg2NJPb97PAggD18b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147b6acf-3cb6-4bd7-c1ab-08dee3578b92
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:30:27.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00AZ3vTOaIP8fENyGc+2p/Av18oCxZUQbiCkQeHoP7WhbEDJBxlfpx+dln3/txH4WhpUZx+uzHTMa6wjA0Kcap4HkPZe3OjAYpylthar/hG6wZ2kt6eMQeTh/c0B09MP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10221

On Fri, Jul 17, 2026 at 12:24:56AM +0900, Koichiro Den wrote:
> The DMA Engine client documentation says in the "Terminate APIs" section
> of Documentation/driver-api/dmaengine/client.rst:
>
> "No callback functions will be called for any incomplete transfers."
>
> dw-edma instead calls vchan_cookie_complete() when a deferred STOP reaches
> the interrupt handler. This schedules a callback for the active descriptor
> and leaves other issued or submitted descriptors queued. A late callback
> after dmaengine_terminate_sync() can dereference client state that has
> already been freed, while leftover descriptors may later restart into
> reused buffers or leak.
>
> Move all issued and submitted descriptors to the terminated list whenever
> termination completes. For a pending STOP, do this from both the DONE and
> ABORT paths. Complete their cookies in order without scheduling callbacks.
>
> A STOP can remain pending until the running transfer raises an
> interrupt. Make device_synchronize() wait for such a pending STOP to
> complete before releasing terminated descriptors. Reuse it from
> free_chan_resources(), then release the remaining virt-dma resources.
> Sleep instead of busy-polling while waiting, and warn if the existing
> timeout expires.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
>   - Use fsleep(). (Frank)
>   - Use guard()/scoped_guard() for the new locking. (Frank)
>   - Keep chan->configured across device_synchronize() and clear it in
>     free_chan_resources() instead. (Sashiko)
>   - Wait only while a deferred STOP remains pending.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 90 +++++++++++++++++++++++++-----
>  1 file changed, 76 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 89a4c498a17b..972c7ea18d46 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
>  #include <linux/dmaengine.h>
> @@ -201,6 +202,35 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
>  	return 1;
>  }
>
> +static void dw_edma_terminate_vdesc(struct virt_dma_desc *vd)
> +{
> +	list_del(&vd->node);
> +	dma_cookie_complete(&vd->tx);
> +	vchan_terminate_vdesc(vd);
> +}
> +
> +static void dw_edma_terminate_vdesc_list(struct list_head *head)
> +{
> +	struct virt_dma_desc *vd, *_vd;
> +
> +	list_for_each_entry_safe(vd, _vd, head, node)
> +		dw_edma_terminate_vdesc(vd);
> +}
> +
> +/* Must be called with vc.lock held. */
> +static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
> +{
> +	/*
> +	 * This order must not be reversed. Cookies are assigned when
> +	 * descriptors are submitted, so desc_issued contains older cookies
> +	 * than desc_submitted. Completing desc_submitted first could move
> +	 * chan->vc.chan.completed_cookie backwards when desc_issued is
> +	 * terminated afterwards.
> +	 */
> +	dw_edma_terminate_vdesc_list(&chan->vc.desc_issued);
> +	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
> +}
> +
>  static void dw_edma_device_caps(struct dma_chan *dchan,
>  				struct dma_slave_caps *caps)
>  {
> @@ -308,20 +338,22 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>  	int err = 0;
>
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
>  	if (!chan->configured) {
> -		/* Do nothing */
> +		dw_edma_terminate_all_descs(chan);
>  	} else if (chan->status == EDMA_ST_PAUSE) {
> +		dw_edma_terminate_all_descs(chan);
>  		chan->status = EDMA_ST_IDLE;
> -		chan->configured = false;
>  	} else if (chan->status == EDMA_ST_IDLE) {
> -		chan->configured = false;
> +		dw_edma_terminate_all_descs(chan);
>  	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
>  		/*
>  		 * The channel is in a false BUSY state, probably didn't
>  		 * receive or lost an interrupt
>  		 */
> +		dw_edma_terminate_all_descs(chan);
>  		chan->status = EDMA_ST_IDLE;
> -		chan->configured = false;
>  	} else if (chan->request > EDMA_REQ_PAUSE) {
>  		err = -EPERM;
>  	} else {
> @@ -673,8 +705,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  			break;
>
>  		case EDMA_REQ_STOP:
> -			list_del(&vd->node);
> -			vchan_cookie_complete(vd);
> +			dw_edma_terminate_all_descs(chan);
>  			chan->request = EDMA_REQ_NONE;
>  			chan->status = EDMA_ST_IDLE;
>  			break;
> @@ -698,7 +729,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
>
>  	spin_lock_irqsave(&chan->vc.lock, flags);
>  	vd = vchan_next_desc(&chan->vc);
> -	if (vd) {
> +	if (vd && chan->request == EDMA_REQ_STOP) {
> +		dw_edma_terminate_all_descs(chan);
> +	} else if (vd) {
>  		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
> @@ -856,21 +889,49 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
>  	return 0;
>  }
>
> -static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> +static void dw_edma_wait_termination(struct dma_chan *dchan)
>  {
> +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>  	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
> -	int ret;
> +	bool stopping;
>
> +	/*
> +	 * A STOP may be deferred to a later interrupt while the channel is still
> +	 * running. Wait until that handler completes the termination.
> +	 */
>  	while (time_before(jiffies, timeout)) {
> -		ret = dw_edma_device_terminate_all(dchan);
> -		if (!ret)
> -			break;
> +		scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +			stopping = chan->request == EDMA_REQ_STOP;
>
> -		if (time_after_eq(jiffies, timeout))
> +		if (!stopping)
>  			return;
>
> -		cpu_relax();
> +		fsleep(1000);
>  	}
> +
> +	dev_warn(chan->dw->chip->dev,
> +		 "timeout waiting for channel termination\n");
> +}
> +
> +static void dw_edma_device_synchronize(struct dma_chan *dchan)
> +{
> +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +
> +	dw_edma_wait_termination(dchan);
> +	vchan_synchronize(&chan->vc);
> +}
> +
> +static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> +{
> +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +
> +	dw_edma_device_terminate_all(dchan);
> +	dw_edma_device_synchronize(dchan);
> +
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +		chan->configured = false;
> +
> +	vchan_free_chan_resources(&chan->vc);
>  }
>
>  static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
> @@ -968,6 +1029,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  	dma->device_pause = dw_edma_device_pause;
>  	dma->device_resume = dw_edma_device_resume;
>  	dma->device_terminate_all = dw_edma_device_terminate_all;
> +	dma->device_synchronize = dw_edma_device_synchronize;
>  	dma->device_issue_pending = dw_edma_device_issue_pending;
>  	dma->device_tx_status = dw_edma_device_tx_status;
>  	dma->device_prep_slave_sg = dw_edma_device_prep_slave_sg;
> --
> 2.51.0
>
