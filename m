Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845723D2A1;
	Wed,  2 Sep 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363036; cv=fail; b=F05+wR1dn4cBlYI6+CncWybwE8i9FrwPu0dcemBK+kkp7p9krwdsgaiUpvBRQhmTJPikLfm3pGE6/HxtgcWjKilpi+mMWffvXGQ6lDkCmDNujEi0C4fZKfmbqJZ1+OAiy6/G8Phf43DysJowDkA2ftzl/Y0t67KYDEmNBaS6PMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363036; c=relaxed/simple;
	bh=vUrb5funoCbkwusrO5qIV9yHuk6/PhkoUBOdL+zSFn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IQRM6DmlPPjttD5MID2QQR+SSfLdggATMjXegv1d48A2FV+wyhVu+xrg7FELZvYkeVa/mtf5lAKta7vkQzUBSZhlo/N25sXUD7eITX015CMIV+8XHBZlF9jW6IC94glD/Z5WtrRHqmt6ZQyWy5treaH7fK8dV6X/uZ4DmU2NRDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RiqVQNxv; arc=fail smtp.client-ip=40.107.162.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RiqVQNxv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgfsYB6oCsbPmUXB46ygQCL1KTRA+AEbw2mYHP0jbR9SUYFchfKJoZXCQBlqzCXz8BNxmtlb0zPMVz7svgfrZHDS7SbcV+GhcXCAvYSHi8Qgn19iXEpJhJGB5MdoQAZxb3rXC0zaZte7ExGmFF73rUBJyJCKJsn3oRay6uhU7vXm1lbce/tLppAE9fXJ2Csl4J5PclSCqwiCd4hzgDA/Nm+uv6Kck4w66XdBMmP5A7la8oPLC4pJPKTFcyIvqOWr1t4tuSwC8Dhidl06BgTJsa5b6FbUaSqRea3czop+umGobvntUTFw5CgAgRVi3PyhxLUCK4j4JHC1TvBNw1xyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzlaWtddLuDcS5kYgeu/iQYmyNo1dB7107pwfVQw40o=;
 b=nNn4BLoRP4YXGzN+zgIL6HyN2jAU2JpMIUm645JlxTgPKS7KY8bcDIWf6X157KU9rDzkkibnU3IYPe8r3gu+Lr8B6mSDXmbSKHnpw/MZ6GkqY2s9UbfIQXwbwi6QOUKxZ0HbyB4GKCB5fAtm1chNfq3Eo+KguQmjSGOVzKyp7Btz7v0ATKEsMF1kD7PT5nmp86Vd20kn7qNffiW2VxxyKnZVzcvveVqEK/YQNtqnt/3s53NnwNMVySH145/GriPjtr2gQRE0XrpsfoV6sLAAF3Ic92ORecVGDhrBR56RThLrIjaaqGmeZjrsFf8wDVfmf1/FenFspIMPvEg6AkY0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzlaWtddLuDcS5kYgeu/iQYmyNo1dB7107pwfVQw40o=;
 b=RiqVQNxv1s9atJaU7zNf5ZGxibXQqZUTwKbed3ZPCRz9YOlj3903xJhOtSLlMrhIK2eEG97cGvDfxcKNWkYUaH05aVSfUAfgkci++/419JfvzgAsp6AlkO3rlbOQ2BQa2ekTssJFuLLmKJ9f1Rt5qm28sEz5QdyIkoYGnvBoWsD+vWPA+fYFOWD/SLGeeZCWmOTSF08hhvnrPoV6YVpvzIIy6vAo/CPqXwUlSvHt+mXgxlIBTk55pLD2L5wpVfEArZRBSSXKpHWaDKMrlW0W+OZDu3s7tWPqujAQfwvIvm2QOPTFGabWFltQtAy4vSjD6XkU9rdKSuIYAKXUCeQ7kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:30:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:30:30 +0000
Date: Wed, 2 Sep 2026 11:30:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 11/34] dmaengine: mmp_tdma: hook completions to
 dmaengine BH
Message-ID: <aphBD2X4IRbSTZIo@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6c0a84-1e38-4023-b023-08df09071f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|6133799003|4143699003|11063799006|10067099003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	A0AGcFe1erI4cqu0fKCUZdJFsKe3lmI2/nKmp/52BPh5ucY5mKcuByh17+CXfwMw0LSoRjlfKPskgP878tfrHvdKH6LNA+NBeYmFeNd7IR+9lT7QoGVwfwiEatJOaq+SgNtcZYTW4p29vSWBz5kdpegSrfpcipH0aVHokFa+/Fr21T7fE2WaO98HvQpqC6/rI/SpM+c6cJG6L9QaMsOGoRwQtcbM1emnzDPuNxx9i9rdO+9E3wa2935Wl/ONN+PfXHSKUIjmJ3/kbYUS7BKDngz/wy0qUPwNzE6nuG7TY0AaI6YzskWaXbIYgbuwv5MMESgbokk2xjc8TxKlZdDTWYD9dh4XsvCtyTjuMmeR2YxgfV450bJkBEcE29RCU+hDGZ5iIun8vQIT3XYphF+Fh2wFi6VaiqSjGndk06ba0kwrvMbYerkMUWKMI82b7wnzBstR/8o12LXg6yatTddrzzO/vDWe7n8sL86loX36YFO7UPFYn091Zg24Jh13d8E+vUIxJvcx1TQnzcl7Bz/cJSAmGpDXvdi4xGfA3ReogO/GLgghFYuDpcIXdfaJceTkugqu6Wg5zRrm0303ItQ/DvRIqOjmleEYv1qvABm7RZNJ2l6+gz7/UnqESnk+sofPAsV56r72h+G5xTLWk1QqSuqqe1UHGwCWmMpIfVcodjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(6133799003)(4143699003)(11063799006)(10067099003)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YES7fpcntJXIPcq28C+BlwY+vTx9lwXHtk+5EhtbJwSg8LDW79n3HsTPoWX?=
 =?us-ascii?Q?RKOsDKxfCMkfAspOi4xuUOyvbXSyL+aTjGU8tFLiAaOnPCbane3xjDm38LI+?=
 =?us-ascii?Q?efO+PQEeaRgVeIyk7qX3h7qES4XajOHfWLppgzcTljhUVXtaO7YMGmvergag?=
 =?us-ascii?Q?3tebV+uBdGD1ho16ZwzQH3NjN/wFl9mGPwg6wNn3Mq8k4LmaiiKOyLqHYDpF?=
 =?us-ascii?Q?RmDaX1Z/HGyxHmOyfd1b7ILtm7x1YE+Pu+WHhulKYNCVN08dFgJyi1VbSNqt?=
 =?us-ascii?Q?YB8dF1L/i2QE6i8actYOzG5cKygCAB+UWXsaVMJaTpTT7VpoV4almuLvbwkM?=
 =?us-ascii?Q?HphqTu02TGTVrgJ6HIFznqxCYiSf/M3yrnhARafyVpEzAdM+7s01RxHNatSt?=
 =?us-ascii?Q?rarUt5CUOUQnHtsy5o4X/RnnpkqDO9AJWb3eOw6yGEolYMQsER6dyc7bseDw?=
 =?us-ascii?Q?8hU46TcfQfntO0zklVdPG+MnV4Th2ehO81qdm8EnvkWwxjkWNtSMlxcFyh8S?=
 =?us-ascii?Q?j8PwAg9TkPYAK1222d5hAvXJoiZG8Xlq54oi1Hsmefydi0awtxZRGXdqFQto?=
 =?us-ascii?Q?CQGMPNkFmd0Br+pBN2UnwbFTO1t8PvVvX12v+WSI9QcRICblt8t7zzD8jER2?=
 =?us-ascii?Q?AUwrTRq8/GXzGV8kroinH2ONXr5CVWUfTLEz6kJIaSKpvTzsggQOImmuX/Jm?=
 =?us-ascii?Q?aEr92t9pHoSmY8NRPYJZ2Cy1yre+Q6ccnAvtz0ZUAP9UD+M3gTs17zK6NRT6?=
 =?us-ascii?Q?abBOBymJPvpRuPep+dq5MPr31SIV7UjMii5woHUl1nov0yptz202xMOongsV?=
 =?us-ascii?Q?+JEhfPGmCRnRAeGTGzdVlQQ+4lbKx0AG81JLkp2JZTMRLh1vjrO/wuNNoU3O?=
 =?us-ascii?Q?SJzzcuPr5LIBdiWWZxUX30dFk4UUee9+1E2oFT6kvMygzwWglnPg24Av0Eju?=
 =?us-ascii?Q?b7dB5TTXbUzvf9/S6nfGcw1U7g88OktrMeu1GEcGmUb2CMmbQQp7lm7l0fZf?=
 =?us-ascii?Q?t+DY+EaXFdbFXBVVBAJA43LR/6ee4GTSGWb5YkID3M05C3VJKDncoiob4aek?=
 =?us-ascii?Q?5/zD+6Bu5l91p3cbyLmYM216D+mWQPP4goast01Y99Qb3TyE0ieBZfcGOAuy?=
 =?us-ascii?Q?mSc0aW41eEmJu1NcjT3cEYGVLeKpqzKxVNxsyQ7SCYfeug36fqImdmHi6leV?=
 =?us-ascii?Q?GRyLL6UXl0pjBga8FwS1mj0IHQMHHbQ8Uhsw+j9a87y/9eKVCmucp/aGBwVT?=
 =?us-ascii?Q?M/J9z01izzMDQQCQ/Rng65aSbkyUhoIiLJRehYVbVuMVWIrSUJuKTtFMAOOk?=
 =?us-ascii?Q?lTT22Og4g5F8GzxMA5gtN7YMFwAcU47ewhZEzxD+u6WO+miE6SVvJMuXjDZk?=
 =?us-ascii?Q?+AKW71UYn7ZcGoX58Y/Rm9yjyvtcJHl/fc0E7ngoVBMBQ0y76EaTa6vA2iHf?=
 =?us-ascii?Q?9f9xY5wsrFER6PxYDqPt3yN0M6Zazuvf6kUaIYQxoRQLBq3t68JQflCp/8BP?=
 =?us-ascii?Q?nCkJr7FPu3g+Z72gkdYU7GAgPnlZmbs0nmm7oRSeE5O/iV6TAweJCctH4UzH?=
 =?us-ascii?Q?OnLdHvHBw0x3+j1D7YeZM9Bd/d7OiP8KkEdHjrk8AdQjMGqpX1kUf84fyXo8?=
 =?us-ascii?Q?gtsDIWmeKLnDj7JQWUauNDQv2V8tWU+3uRRigzNM2v/3zyAbMAdY6nZXrKko?=
 =?us-ascii?Q?+e0CQvwRhtrUEG9Ymg0Cj2AVGSvJCPc6N7PENOo5Fw9nUHeYAnNW3wVWmfbL?=
 =?us-ascii?Q?KeL9AbDCh97qi/KccwnIIgNEQkMIZv3ftQDqZRiSiXkGB/a9b0RN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6c0a84-1e38-4023-b023-08df09071f6b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:30:30.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZAN1Icq1xNfd3nIkLcVnaM9yvFeiDo7kutr4HNXmqazrEM+FsimEGdodosix1NB8YGS1m4XK+f0HKczH/BDyJfc6LEZojpN9DJ60XJRT51PWbcxymWUuqkemwgXf9cJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On Mon, Aug 10, 2026 at 11:09:12AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mmp_tdma.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321eeff7..d20aaa7567a6 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -102,7 +102,6 @@ struct mmp_tdma_chan {
>  	struct device			*dev;
>  	struct dma_chan			chan;
>  	struct dma_async_tx_descriptor	desc;
> -	struct tasklet_struct		tasklet;
>
>  	struct mmp_tdma_desc		*desc_arr;
>  	dma_addr_t			desc_arr_phys;
> @@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, void *dev_id)
>  	struct mmp_tdma_chan *tdmac = dev_id;
>
>  	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
> -		tasklet_schedule(&tdmac->tasklet);
> +		dmaengine_schedule_bh(&tdmac->chan);
>  		return IRQ_HANDLED;
>  	} else
>  		return IRQ_NONE;
> @@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  }
>
> -static void dma_do_tasklet(struct tasklet_struct *t)
> +static void dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
> +	struct mmp_tdma_chan *tdmac = container_of(c, struct mmp_tdma_chan, chan);
>
>  	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
>  }
> @@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>  	tdmac->pool	   = pool;
>  	tdmac->status = DMA_COMPLETE;
>  	tdev->tdmac[tdmac->idx] = tdmac;
> -	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +	dmaengine_init_bh(&tdmac->chan, dma_do_tasklet);
>
>  	/* add the channel to tdma_chan list */
>  	list_add_tail(&tdmac->chan.device_node,
> --
> 2.43.0
>
