Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D4F4A4987;
	Wed,  2 Sep 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363008; cv=fail; b=Y5e9Hx22CvLGXMY27q7HGg7M0ZRH2QjLYQUzRbwqq38kj5D3hEYFYrVo3J8brvmKos2sNHWoMd7W5C4Ywxo8lUGnTNQup6sU6L4NyRJdi+jR3ucVfVcLyN8kbB81chxOq7j/3a0ruXK3PK5jZd/OMH8ZPAx+U2GkukKJGaeOYoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363008; c=relaxed/simple;
	bh=DAZcs6ZV/C1jdaN622YyBA2BlNTY/j0oDc6L0Fpu0o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CvnhK6Nln23/8X/FfRWOkPsewGTEosLHqr2GKVgbDrEU1pgKUtJSVbg8KBLB9Bykp0FZjjNVc/asF2Dj+Oha4tulnd+S/GwvaqFQ+jVfrxcIZ0XpmY4RDu9SUg9KA+yyuGJ8HkX+/8VosII1JXRcBGkShx7U8HltFXi+dv/8TD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vAGW3Q7n; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vAGW3Q7n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is9Gg9iYLI9O3rWYJjjOJIxXcD12WK0yxOpbwMLAJPefN/ECVfBklHUCQlOCvOtbmign6OfbqUX8eiGV5mLk6/Hemwk9aAUHFuxTnJDWZCJ4E+RN+QmOzSwO/kdJIoHWsVeW9DZS9paR852pIsMMfVdAY924PJz5+hjYeUNBscYBhbtIy86M9ABfj8q0IT0VAMuwlr+Hr9xlEGTEoSF6b/EhNdjnJdxJWAH5yEGarTh0cXQPxT80wv13H+ab74SA4MwLfPY1TZfMNTBBEuuvjaTKLepGxG2AA1s9b9HZ7mZp8RJNbbFIxrQ7sMyT05otSWqauMLBKjvMPutltXbbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01i3tFMTrdNcT6+lTyeCNmyXDTeMypSQ6TN0xLCNqC8=;
 b=T9t1if3zEyPQ9vGMnva1H1mMavLEWc0cIVd0O6o8xUMPo5vbkmCiwMXt1FPeKaOad0xbPYvb4yC88J6H1X5E1BygxEyET4NZxbmQ3S1MDrjUgwPQK5lDE9GCafzY0IoM0kly0668C5/uZE2KTbRYqPK8dXsTJNKXygN6/JBaGwzUsnYhR6zuyJ6WyggMiRJ9XzRJRAnC02UWBuRGUazsDuiO4T3s8EUPrYUydIhVQJP8ltiYG1csqhwHLFXZ1vna0Fe4DXhwmgRUyCkjb7UYHG+9wFBOR/8ZiN/e16zPD+VBDlR7bkUCpaHm2WwcriegIVEQW4R43YSzB85xPNmtfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01i3tFMTrdNcT6+lTyeCNmyXDTeMypSQ6TN0xLCNqC8=;
 b=vAGW3Q7n3okxVfu+zuBSWuG38pYivae4JEBt7RS+g2smsHwnCNXFjJ+h+7v50GC2iokn0TKJTq2a9Ht6GN0hQGT2r4edLp0UCAS+NWrOnNmH+NaDOD2sQtp0f5rbYDL4BjLpsY0K9zWuEOGMNp4lbaD6+h4BlIwk6AvUr6ghQVp67+NOq9SmzqAmeKtOsDUy8uomZGwqgxwv/WybFBwGqi1M8Esb9p0GoMnlCYkJn0zCR5AgAfBNltBSdelNNGD8mpj9aP+HpMH+Mji4DDFIVTDE0wYh7IA6R6KaENYqBwN/nBdnm9CvIR3nCInol0UMSe2k67cUR9KMzxfaolP55Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB910871.eurprd04.prod.outlook.com (2603:10a6:910:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:30:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:30:04 +0000
Date: Wed, 2 Sep 2026 11:29:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 18/34] dmaengine: xgene-dma: wire descriptor cleanup
 to dmaengine BH
Message-ID: <aphA9W2xtXhBr1X5@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <29f97cc894a9c6fcd4aa1f2981850476a963db52.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29f97cc894a9c6fcd4aa1f2981850476a963db52.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB910871:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebdc3f1-6908-4ed4-ff92-08df09070f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eU5vmRrVVAXIrwoQeAG2faxmek4WueMvTmwHjztvY0vwnQlHX6CwC4rhcCM3bLjY+NIeXTgH0Ds92fCKZ9M+z2Ip1wcqDGrTLk5cm67Qv8658iU5AqQKB/JUrY8ANISny0gu5KthQoynQmsa9MwUPvtlBek9IOhf8YSucjkSQItEsh0wLporSszctDNY3jiHFAvgBUzhXyQMYTeTgYcPkRuHf/iaNV9EJHHPVY5vxreBNplPJ96ckQIRaPfEtceSCQb9R47aFPu6dEas5DAw3AvgUMS5EpW2uYzJSmhVmI9UU2QByH5E2SSqVgpBKEizlMN0GO/M++EGyLso1MwvVbw6DoI1cxTlLsPC/2q2foTLs9LMTrnYSS7UnWzOfn/+Ijl8LkZlA4go4zKcJNM8PA7DUu7rbXXNo7vglzSnyIgGJCE+76bfv+1bYyc4bBBApvdO0PhssYOV7ZB4/z9ETvrNhb6tJHZnmmgXCEg6whA2k9BcgI/xPDLApu82o3Dz0tRz4Uy9JyFf/FZ/Y73jQDW+IJdo7uEgOmCZQdKeqTriY9EzulyIBnhRPSKPKa2kWvl1+xP/NAD62o1QL6yjzSqGr4E62upu+hVTJSxGJTHLqQNSsGpMvLLEvhILWODc0elBBRvJIbCQYSpK6e1sshCIXl5VHHUwYl23Njzp15Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z1A6e/Jt2gA1VUD1twCUdCXxtNirLayHWCa1k1SieakC95n288o09WTAPx7D?=
 =?us-ascii?Q?L4qoWwOnW7pNuwlXlciv9KrpzZnfmqyXlXuNlkXr/Iido8t4I7YbIU/mc+4M?=
 =?us-ascii?Q?bvla42Oa/3w0zF6MOcf5vn+wuVaFxQmz6aFsCJ9SV4Sxh8UjoNRfuGsr+DiC?=
 =?us-ascii?Q?jhuftKHV75ElPt9+7IDHlpNdNsXAp+QikilKfIPWV+i5joclxavMdGAUHAV+?=
 =?us-ascii?Q?BXfUmu6R/TatpHWClwQ7zf1NRnSZeYV3NSCjHfI1vjeUHeQ7a4cU5DRjqZY8?=
 =?us-ascii?Q?9Eh9/QIAEFGbSpKZvVFCWwPwC+NqUl7O2nc9dAV1nKToUR0eFRptniQInXA0?=
 =?us-ascii?Q?j3IOMlFF7aHkW2Dhx+1pVT5OH43CE3XjuiTb46XxJcW4usjrm/CBStqYhb0d?=
 =?us-ascii?Q?KT/HkvaWZcbQAGGCxSFuRW9Pl1LnY9me4E8ULZPF/joCpuhNYq/wUUihLYcA?=
 =?us-ascii?Q?FJReHlRrsBm0LKEXUy/6lEbTe5i3bBVYciZAVNfn0tKVx4DEVkcXSMV/uP3t?=
 =?us-ascii?Q?SuKbZZrEvmfuER9VutUMc6Ng4aPLAa+oQsFAn4J5b++khhRH/OI/XWogLRc1?=
 =?us-ascii?Q?E2obYRL3508Y/bq1/q2f654bdcZazadtlaVZJGAplG+aQa/VF2SrxJwWmflA?=
 =?us-ascii?Q?qeoaU3C3dl1bzX/qJFrG+xoL0FDmCx1X18xh2RqaFKxdgMndM6nfho6D5icV?=
 =?us-ascii?Q?paJEdw/4C+3mIrrou0rf30CjsA+Mn/ZrtopPxG7xT4kbs6Iz0hFS56SYidLe?=
 =?us-ascii?Q?/sE6HuX/zmSlQ6hBPPMBJjn5aUlLrLWjrPVmZh1LrpKHWHhxQqoWkB63WBBT?=
 =?us-ascii?Q?CXC4Yc2pD05U8PmFjUIzU7LBRUcHCzeIInxoa1MxUWJ2SHT6mDClnd3roBog?=
 =?us-ascii?Q?MziVJJTMMupFxOPzQA+9/Q14CMNxHVZ2DBi3vnTibwcZiMdcidpw0PbISqxA?=
 =?us-ascii?Q?CCYDkjvl7Z7qxhdSrB8QxjmykVIhf96oHS5EwkufW7aFUvBAlrrFt8ayb8bm?=
 =?us-ascii?Q?zwaGO9elYYesnl3hTTfhCQ4lHg8tE8wGY+GBZgU2uwufAX/cYu7/jaH9NhFJ?=
 =?us-ascii?Q?JBYhZ+QinvQqR+DAm5d4ZQWnelyWMDnwdAUYJhg6NaB4WakjvHOFk7WGKl0V?=
 =?us-ascii?Q?3IRfhvsKy41P6+RQ+tbc+JhnUrdQPKKdVoyN5qx3FmLTUBkdmBHrrVFAS8Uq?=
 =?us-ascii?Q?pQ2z7Jfo69zBvqX+bhGxv1xGM2UhnUfiyLfAsKHCzS/nIPt6N3QKk5wdT0qd?=
 =?us-ascii?Q?UEKjAVf0HlaZDBgKiip6sb/n6bdv4hw7/12T8Wap+n57IaRaZpkJZeKLlvm5?=
 =?us-ascii?Q?Ny1pIcQy1l/SzCZQVKPM+0owSOG/I9pfsztCoWOrZf0u5R0MHW9GPsXP5tSk?=
 =?us-ascii?Q?YeqJ5eEd6Ps2DgpI9A02t3yWIZhK+K5penb+JDk0G/jXiWTt3VmNb9BePnkt?=
 =?us-ascii?Q?efiumhpFx/QiyWMlIpr7Uwailf0zB8aM7kBa4rML7OR/wYbkb/QuZGdceute?=
 =?us-ascii?Q?n7U8oadrIG8lI7gZfZrF9S1bVT1/MYmvl/TWtzV1+63eUKmnPlCxD7TmdrC4?=
 =?us-ascii?Q?RyNkN1H2Bo4ljEW1v/rKVhLm/syhVW6gYEg8MgxdBQ2SDnzPH4bBQtMtiKC/?=
 =?us-ascii?Q?L77bCmllz084Keb8wsX/wWucAFeVFe9AgWmsJa/K8CKCMzBGzHl1GBzpHO3p?=
 =?us-ascii?Q?eIKBBSUnUqBdw/HUDq2BTuP+8RNd70Bfo9yHyG7XlLv2E1U/U7hSZfMEq/cm?=
 =?us-ascii?Q?l/CtWU+j/B0XogS6inlfK0Ie6W+RGoWn+51XHkl5K/jPM7QsD5Bl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebdc3f1-6908-4ed4-ff92-08df09070f77
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:30:04.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBwpV3o/1xK9fudDqXVNSLKcc7kclFmnBr3qyFKeTRQAYmm/dlE1ygOkXi98YZKT7QCV5KZbtSDhMYR71yfJfnRGzN+9HYClh00LYaKF47qUd8U2U75/1yfJuHVTsRje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB910871

On Mon, Aug 10, 2026 at 11:09:19AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xgene-dma.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
> index fa1173e49900..bdeed908e37a 100644
> --- a/drivers/dma/xgene-dma.c
> +++ b/drivers/dma/xgene-dma.c
> @@ -260,7 +260,6 @@ struct xgene_dma_desc_sw {
>   *	These descriptors have already had their cleanup actions run. They
>   *	are waiting for the ACK bit to be set by the async tx API.
>   * @desc_pool: descriptor pool for DMA operations
> - * @tasklet: bottom half where all completed descriptors cleans
>   * @tx_ring: transmit ring descriptor that we use to prepare actual
>   *	descriptors for further executions
>   * @rx_ring: receive ring descriptor that we use to get completed DMA
> @@ -280,7 +279,6 @@ struct xgene_dma_chan {
>  	struct list_head ld_running;
>  	struct list_head ld_completed;
>  	struct dma_pool *desc_pool;
> -	struct tasklet_struct tasklet;
>  	struct xgene_dma_ring tx_ring;
>  	struct xgene_dma_ring rx_ring;
>  };
> @@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
>  	return dma_cookie_status(dchan, cookie, txstate);
>  }
>
> -static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
> +static void xgene_dma_tasklet_cb(struct dma_chan *c)
>  {
> -	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
> +	struct xgene_dma_chan *chan = container_of(c, struct xgene_dma_chan,
> +						   dma_chan);
>
>  	/* Run all cleanup for descriptors which have been completed */
>  	xgene_dma_cleanup_descriptors(chan);
> @@ -999,11 +998,11 @@ static irqreturn_t xgene_dma_chan_ring_isr(int irq, void *id)
>  	disable_irq_nosync(chan->rx_irq);
>
>  	/*
> -	 * Schedule the tasklet to handle all cleanup of the current
> +	 * Schedule the bottom half to handle all cleanup of the current
>  	 * transaction. It will start a new transaction if there is
>  	 * one pending.
>  	 */
> -	tasklet_schedule(&chan->tasklet);
> +	dmaengine_schedule_bh(&chan->dma_chan);
>
>  	return IRQ_HANDLED;
>  }
> @@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
>  	INIT_LIST_HEAD(&chan->ld_pending);
>  	INIT_LIST_HEAD(&chan->ld_running);
>  	INIT_LIST_HEAD(&chan->ld_completed);
> -	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
> +	dmaengine_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);
>
>  	chan->pending = 0;
>  	chan->desc_pool = NULL;
> @@ -1556,7 +1555,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
>  	ret = dma_async_device_register(dma_dev);
>  	if (ret) {
>  		chan_err(chan, "Failed to register async device %d", ret);
> -		tasklet_kill(&chan->tasklet);
> +		dmaengine_kill_bh(&chan->dma_chan);
>
>  		return ret;
>  	}
> @@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *pdma)
>  		if (ret) {
>  			for (j = 0; j < i; j++) {
>  				dma_async_device_unregister(&pdma->dma_dev[j]);
> -				tasklet_kill(&pdma->chan[j].tasklet);
> +				dmaengine_kill_bh(&pdma->chan[j].dma_chan);
>  			}
>
>  			return ret;
> @@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device *pdev)
>
>  	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
>  		chan = &pdma->chan[i];
> -		tasklet_kill(&chan->tasklet);
> +		dmaengine_kill_bh(&chan->dma_chan);
>  		xgene_dma_delete_chan_rings(chan);
>  	}
>
> --
> 2.43.0
>
