Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8011DB13A;
	Wed,  2 Sep 2026 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360969; cv=fail; b=QVGad5gD34vuCVyyXZWZzC1L3F5KW7H/kxMo4zDZvI+u69aaoI66CxXRdefk5LNPbAwYNsDTg1DBRi6aqV0ia4IUm0PfRfe66uPzDQyFwUz/D0EzilNkvSqK7N1NGzAzJRljZNYC5qqgLLqxpAqGVwAJJlotIl2aVwSY5Gfpick=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360969; c=relaxed/simple;
	bh=LAsywOAWBfIQhmApv2gQQ6NCdRcJYNQ7YePFPS6x1QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uOO4wPxOgMXjvtkLkSAdywPN9yq1GivAwDppH/rPzkfFCFfei5eIr3G/KaBIigE5k15EhqoErWlRVyXbrb+OH1otVTUUqH/8wQ2mKJHlexCK4J3rcHdKmtuLsExONOwLAEoFAmiXFnGsr5bBGVYdCCva2n4qYOj6f6f4Ck/QrSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=va03Lpf+; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="va03Lpf+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTddvHkU0DXCOICIDi7xxMSwryitO3WitP7F77h5NmIoPSvR3BwSxxn4uSiu7xiaVTZ6sDOY/vZmA9kZsfWSHBGzGAoJOGoh8irxvBzoUpFjB6bdMkDgcjRhNkWREtrEZj2m7F/s/7txUnFTZSTLxFd4j/HYWYPpIBe3Ix+O1uO+kcSyNUQlhe2sJ/DryNVgymVfod5FtSNmy6XOTOl8eeP50A+SIn8t+bPzULAGFYs5eHqc8o41fBi09prhpgkOtAo4RVbCVNjRteT5q7aE/cJJHZWKtTfGz0oFxDR/v9ZbnsF5t80DRsFyQfOexmOdtmKk8EABBzIzGxScX8V09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd0NfaRWCwHc3L9hNnl6NW7IdOn/6es8IqptXFqB4cY=;
 b=cKZo6lKjX+OiMQA0L7zLxCvZ2nU62Rb2zlF7X5XZAaA3bUvZbFQK3IPpR4pIENTJn10wwxDc6XyM1pIsALXG+i2QH5NllDl0LF/gS0FpLFnfrcDOCi/OUuGx34aRg0dEvxTRVVhhoMHNZrXXFNMfOhXfzc8EQ6sxzFsNwvZy6K+800w7wWgMAJWSMZAxcTUq3O3yUCATosod9ORw7eLHAxn9GfNal068hxUZqu232DrZPvzIbaFe/DWXYytP7lw+XbJMkyej3CFkvBZuKOG1N1Rk1z8gO914pJ1QmjLc/ZeFyLhHScDVpWQPSdKEw4Gr1f9Ab43TCEKSYI9/wb90WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd0NfaRWCwHc3L9hNnl6NW7IdOn/6es8IqptXFqB4cY=;
 b=va03Lpf+XvOpM9GosOkeO7ZoGgdn1SG7mU5NidKHTYhufdBs/XcGyt/BIyHkiLPcM9DMdf7ZjPshD1wUJZ0AN/Ogp6rSokE1Qz3NuDS38+rdcxVG2UulW08rUQnQQYe3By9AX6xJQBZuF25OUPB4bX+Zk8yO8maEvBwm/ocVuQqkPbWMPujQKpx2LA+ppZY3hGq7EAqeA/R5VdIyNBPrnAWZ0Tbz8PdxH6XrtJI8FkRufZMEQghcuiqm0mmhavSPTjgqwoe+Lj+hmU6nm60f0gkRlf1gULpdRC4bjJc3RxPGHv1tdDD1l8dLd1woLETckTVe3q3Ds8W4XTXo75tv2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:56:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:56:03 +0000
Date: Wed, 2 Sep 2026 10:55:56 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 15/34] dmaengine: pch_dma: convert tasklet to
 dmaengine BH
Message-ID: <apg4_G3SpRXrnAT5@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <920e972b55af0bcebe09383f5f00cf5dc75e5cf6.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <920e972b55af0bcebe09383f5f00cf5dc75e5cf6.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 405c48b9-0fee-4aae-a3da-08df09024f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|19092799006|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	59MO635OuRe2pNGDfNmFhCiCzE47kJjmy56BoJizpUp2CwHSX6u9KWbwXkDKAOzI91qrwsb4wI9D+sBXMMmNb6WyBIrzMFnK68U/60koXqDE34D4HZQTQy+hRH9w/xt/slwsezTGmv1z7EifDH6cP0rDBw/kABz9LF37sWbAJ3+3uPOEjqYqLkfDyOKku7G//7Ozwnu/1anijCEz7fvvsqBfFFpfMaXefUWruPoLtmun1eciYNTyjgj1rz6vLiDukYZA7p3lcmhbLqLtg1Zzmt5RctwliW++YUjj6GNGOpOu3r9fRk5THhDQDaTJ7YXYgqGr9OitNlO8z0mCPSi9c8yI94B7TgoAn76Ep/KO+mRgV+bEmztN/QNTtiFsmjEomru76YNEOkCZrPHG3+XUL28nGmmqIJnh2E8qdvWhkQq/5b70B1ikG1hcRrc9VW+HtHfXoWuUuGxdZ5o+3x43qAhQltX7Ijh0TXy4+Kf2gvh2A+6q3YRDLwIqwoEA9HpeGCKf8ONSZOgUuic8t+Dn4KvukX0PT9ooT+tUfdnED60m/nsKhgDpY7PdrQmzU+K8BnHKjkGIwExFtmjKbfTFVh1vIAEXg+MqV3XkGHWnzUMWrLs/Qygyz/KfUyfC/cCKPlT9+vslszIV16GXXuqyL2ue/SzpqE7hkEfDMNZhwaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(19092799006)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iYehQRJTifIH2M6guYN0kXWogeux6R90/XkBPPrTlBvLpgWKNQ0PPHE8L+d4?=
 =?us-ascii?Q?Q6IhefjK7YVT1MR4lB8l3b4fmTJiGAbYzM1lN1yPZEwFXULQKhxZ7K2SzLfx?=
 =?us-ascii?Q?Ft1frF7Z1l16cP7ZDyzythqG7soD1zmZ65Dif9w2ZAJRXc4tt1kQQdiLxK9R?=
 =?us-ascii?Q?raBwnWIpfdD0FZhDxz0X1f1/TWzIzTKP+TergVPdtBYSUk8LL7NiPR8n2Vkh?=
 =?us-ascii?Q?T/3m4szish7aOFCmf7lX67wRSqNkkb4cyzzsoOhFlAtSuT19bCBBSceZp9It?=
 =?us-ascii?Q?Gj8eK6QFALINi7O0HlKfn8gG+Cr1Nuyce+x/sOnaTrnTI6a7a7C1+O2DJlBp?=
 =?us-ascii?Q?0xA/Y0LsJQ8Pfxu63nksdtKPPPN8DT8jiLdgiii26NMO/SnJFldjUSUDEpDa?=
 =?us-ascii?Q?GZ9MXj6lWYyr+YSd4iakJJJdLjyJhdD7j/Yg+J3Xg94Zu7QuMyzEdSypGvVs?=
 =?us-ascii?Q?645z6LLkBxS1PktzPl1tk5XXpsphNHcXXWG4zDrX7A9MdREzmKLEQYiOPYF1?=
 =?us-ascii?Q?VLES/tq6JAXV+C809sHtmmA6NH4WAVGVvwYZZuajd3AQivsD+ddOsKfBzZBe?=
 =?us-ascii?Q?wl7JCSt5+066lZXKhlHjbJUxj1bcppVcwHHjqlJfWPRtBnQPxErhMyujpcxB?=
 =?us-ascii?Q?lExetiim2V3pUKvVY5JQ/jzC/Mkm3tI+sOQTM6p65OUFADGVkK10jhXga9WV?=
 =?us-ascii?Q?zexZNdjRl4ioDna8N18aILfm4GqVRL2Oib5K0psSsl8QzHTIKO9vTJpPyypG?=
 =?us-ascii?Q?PcQ77LWhg3CPPhVvB32f71mkRUl7Hucqo9lFc2yB3JclMU0ujcGy9zSvaepO?=
 =?us-ascii?Q?EZO0P4Oy6cgoZ1scH5j9KDfvwSSbTFv4MT4zWCp4ec3yb9K2x0MXSmyKVjHG?=
 =?us-ascii?Q?R2WfXnZDhG3hudguuPxlClmuwHg3ZOQ9HWhk3xUSU9CmO8eQNTKjCTO55l+m?=
 =?us-ascii?Q?CHsOSkoJGab83jXhwCwGx8dfhK98ibOc9FPWUBHFIVgUhz+ig6aZMeSAwCLQ?=
 =?us-ascii?Q?TQ7bV4eOTzzfm81AmO4QeK87SpnHaP9EI7Q5Is+lFPS564RHqlpYFo9RYmIc?=
 =?us-ascii?Q?+gdi5+kDg+hb/nO/yz9ZvgKCBOwOC4LGNfhxinMcg4mJAw1HL87V9apmPyWl?=
 =?us-ascii?Q?+nTNJKM7d4/NqUSyNy/fVx3GXSsg1I3IVsUwN2rvss0k8c7jew8b5IsqbmJt?=
 =?us-ascii?Q?lJo2iaRxJ9aL0Znxj4uyXytJtLmys6cyg0t/soyVQqk9hemr6iQUAsEomlA/?=
 =?us-ascii?Q?i5Wble+RsUzLfZBi62F/AYTQVyh/ic54NgcgDszEaqS4cGEpfDWFyL+079pw?=
 =?us-ascii?Q?14DMsa1yX5MAfb8GhMWtIfYdHit4fL2QNvpO2/bvHxYwzgzp5jHFw+Xxyilp?=
 =?us-ascii?Q?NOMJQHObbMOtB2mw20OG7fWIYLhBqe/Hd+xVwq/QZLpDRMzEyQ5ZZCfvjUQi?=
 =?us-ascii?Q?fcUCwSMiLjCzHx/St1CqL8PBVPgoKPighljghnV+qCEp0DRSH6/5oZMWGf1s?=
 =?us-ascii?Q?cONO/qje1AMKh9ApwpEoEZJVPn+9+XrUS6DgUIKbDG8Y4PAPqXbblsNJii/T?=
 =?us-ascii?Q?8lQATjJr4kfhHXxuEJwzYXg+hMk/gJuZ3YYDuoSIDFRbLaRfMlnY//MuSH+X?=
 =?us-ascii?Q?uNEF53joxLoE0Q5armi2ZBPWpUD/ti2pVD+bsfcsRIQcdFcxSLKyoEms/EAk?=
 =?us-ascii?Q?vW+deHQLjJCCxW+a+j7c0B9Sh9F4+fax/sVR3xn15Q/NlRvK5kfF3Lir2kN/?=
 =?us-ascii?Q?j27QtxPajkTvzrYn15YbQxJEqnw5lTl9fK9OCISF7aec0KOZoc7K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405c48b9-0fee-4aae-a3da-08df09024f47
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:56:03.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDGsiWhfSvZRBkFOlg1kM+leDXz6pCIT2e8zKk0aNjGhfpVp1NeGQoE3oKlbxIavoLg00rRJIrq1P7fKv14wySe4Ei2Vog2pv7oYhoZHSh+vr54g1Prg67OIto7gGuxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

On Mon, Aug 10, 2026 at 11:09:16AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/pch_dma.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index bf805f1024f6..eb372aa328a6 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c
> @@ -91,7 +91,6 @@ struct pch_dma_chan {
>  	struct dma_chan		chan;
>  	void __iomem *membase;
>  	enum dma_transfer_direction dir;
> -	struct tasklet_struct	tasklet;
>  	unsigned long		err_status;
>
>  	spinlock_t		lock;
> @@ -665,9 +664,10 @@ static int pd_device_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
>
> -static void pdc_tasklet(struct tasklet_struct *t)
> +static void pdc_tasklet(struct dma_chan *c)
>  {
> -	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
> +	struct pch_dma_chan *pd_chan = container_of(c, struct pch_dma_chan,
> +						    chan);
>  	unsigned long flags;
>
>  	if (!pdc_is_idle(pd_chan)) {
> @@ -707,7 +707,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
>  				if (sts0 & DMA_STATUS0_ERR(i))
>  					set_bit(0, &pd_chan->err_status);
>
> -				tasklet_schedule(&pd_chan->tasklet);
> +				dmaengine_schedule_bh(&pd_chan->chan);
>  				ret0 = IRQ_HANDLED;
>  			}
>  		} else {
> @@ -715,7 +715,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
>  				if (sts2 & DMA_STATUS2_ERR(i))
>  					set_bit(0, &pd_chan->err_status);
>
> -				tasklet_schedule(&pd_chan->tasklet);
> +				dmaengine_schedule_bh(&pd_chan->chan);
>  				ret2 = IRQ_HANDLED;
>  			}
>  		}
> @@ -877,7 +877,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
>  		INIT_LIST_HEAD(&pd_chan->queue);
>  		INIT_LIST_HEAD(&pd_chan->free_list);
>
> -		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
> +		dmaengine_init_bh(&pd_chan->chan, pdc_tasklet);
>  		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
>  	}
>
> @@ -930,7 +930,7 @@ static void pch_dma_remove(struct pci_dev *pdev)
>  					 device_node) {
>  			pd_chan = to_pd_chan(chan);
>
> -			tasklet_kill(&pd_chan->tasklet);
> +			dmaengine_kill_bh(&pd_chan->chan);
>  		}
>
>  		dma_pool_destroy(pd->pool);
> --
> 2.43.0
>
