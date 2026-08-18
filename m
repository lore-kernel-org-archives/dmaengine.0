Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B2345ED7;
	Tue, 18 Aug 2026 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086615; cv=fail; b=Uf7aT07dMg7XGgurLixY3fHoAjSstk2bac134zgchb0pPFI9i3dAt0wL2Cqsuh8GDmMMokX7SinKGOIoR6N2GYrVyaOKBj/PX2m+XZ5S/7MEisi/7QeVN8bnkJLmDJWiJGVApJSFZTUrEDVKA8COYp1DSTn4geMzjPqc2UND9EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086615; c=relaxed/simple;
	bh=myd9W/xzUtN4lyvNw1SEZxMpMCGITuxIN9Zx8waQ7/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=prs0KYwJ9G3zdE07fJk2Sg4IbMH8KwMu6JU7TZZg/zkfrf3eNfF70qFD1N+3F/9hphPc+XvkbQt/pA7WoYdpoLDbC+tolqr4RWtW747aO5N8vuRybXFzKzb9h7pMkJvo9pqSLjXNNFb2d6eQnI7sXgbxuUM+os9m8pgccSUT7iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wgj5n+oB; arc=fail smtp.client-ip=52.101.66.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wgj5n+oB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGHiDXLOnb/85Mz7EUS9IUH7G+9Tgbu1iB8LsNGzYKh4Kf/Id8k9Ar86zNCDQOkRvnD4lP3eKlFoqwZc/ZL/I6X6KwgX0ORRef8OeeCfPz5j/lvN4Z2ak+Re1FMwxD8nP/MS5spHaY+N7GF6f4i3Ev4dhyGy8FUqZzJTM0vkQiQv3d2RYnTg0hc1i2BjQMOLjiP8Ip+cwSTzYb+SOJlTdUT3PlsoFgi9NLtcrNUpvriHmzVCbMOYRM2DuEIm+GiTPhoVyG0e5sn2ZgspEtKU/CGcXsKBtnF/L9Hzhs9+1WOtG8iLXND2vXbMik/f6YOpsFx/SSGbCLqljiPvtXlVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMCgCWs80nCyxn3jzoluLtkBTdQ4EdzLEUdu3WC9Enc=;
 b=dqu+2Y2wEIFGnMCF+Y78Zk7hxcLedFLXC1jiYpncKStwCel7hJa+EHriMB8SYfICFwEVV3PVgVe0xpJIgTDjXGjBgloej9N/bXpcJTDRaBqxyGUxEwxFW5AvhjX9U3q7a8nd79kcFkjchwljHh6gWI8LiRyl9f7tYCQpP36L9D9AyPcW8ELuL6fiC0gbYlShR6a1Jzosm0dFkO1IR5HPzszKtlpmQlLC3QNRY26TIPtwTvx22ztwqbKEJOvNDaqyE6AioKUSljtb72NGdTmR60VFqMJKaclNIuXb5U3waKNBvfZrojE5lXF7DJB3pJzlp+vII5WaarpuMG1nj4lfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMCgCWs80nCyxn3jzoluLtkBTdQ4EdzLEUdu3WC9Enc=;
 b=wgj5n+oB4oo5pU6IgrzNSKs3QhS24zU7+QgHV8kNRmjzbNjQpBD2ES1o2YGdprGboHIbEawpNucWqd4jciuxDeuw9N0H9nD83XEUiSIMTkj84WiBPJKqh4IDWBd8QQIwxhKo+rAchEldARnPlPnLOPANCjbktNqxehwGQXZKPyh9z/shERER7RjWw/cj0+BIylBJmi7+r2HhvxztjpzyiGkmQyxee8FjBFb+ixqt+V1Gw1hwTb54WWe8beU9IoULCVIiiSREJmOV+lPwOH4Pb7uP69Mu7xRXkqqmVoc+NGBFegmso6rCKxXD54enG+UXKucTUGbEYFL0+jU5sGn22Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 20:56:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 20:56:50 +0000
Date: Tue, 18 Aug 2026 16:56:43 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v2 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
Message-ID: <aoTHCw30mgaLymfY@lizhi-Precision-Tower-5810>
References: <20260727184844.12647-1-logang@deltatee.com>
 <20260727184844.12647-2-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727184844.12647-2-logang@deltatee.com>
X-ClientProxiedBy: SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::34) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 0077c356-858f-4a9e-b745-08defd6b3910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	9FWUw2QxD0WmAKRf2fjykTN6/zpLEsCCUq8/ZiHlpZOOElZ6tw1mlSFYVMANBGZW6d7O11Sy5UWlHTBtpjrcvK7s3wYSFB1PlfLpx9mf2mD6f4wAQboTJqg0ZRpVYq83YoYX/chCZmUPZnbUa2kQEjgw7xsYKLdCz5nQC7/j9MaCd2yiWYcheLWb0ot3BqJhI6s+HTd+RZ+sJfzAn2KglYkPfBvEN55z7Vq6DQchvuslZvUojQPupJmZqEoR8sWKIdHwz71n4lUEy+kyW/sHY0FF+xZ3LuTRcQHgLyH4UcMIo50NPmwDqTkZ+2nip+L3UO/0MpShWBVqv0HfRFfQRiDeO1J+we+vJ6wlxea9VaWxEW1/ASNJsCir5WTKS4B2UuEHB/Dk06RjkUpYeZ2WGXBCwqBNdZPiGgVCY8mhzqmDdvzmjf1ZdA+sv+Cdpbr0eD8TTcIrfYtB88naDY2D/h+fq7klF2khf7c6OUapEtpq4dcKyu2AulwMowMw3DihhmsA1erpuIgTmOxzqImv08Il4WqPw9rW/WgvuhoGYFMmdsru0edAJQ6XG5jEfkXPQUhtB2BXu2a2riENv+UlTYAxU2gr57hZxYHTCLCSlkoJumu2kFY2vJB8Iw95cEpPN5LBKVYWZwvfm2tqjd0e8qrxQUuNvP79traAn2ss6KE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZNFbQLO5Ug6TmxPFZkdBJqqtl7f0YtTCi/R4BHZIXKnU1nX4tiL6FumIy7bH?=
 =?us-ascii?Q?tsjpCDR9JXHZ33K6VBGW/nqK5X9AuqqH1Ju1QnAoUqy3ENhqqSuW034P8pax?=
 =?us-ascii?Q?Lt42acheew7OUqg3Syl49p3bIB/PAX1blnfK1bWB1lO5DGofsFZudCD0GR2J?=
 =?us-ascii?Q?f5QtwXyro/jbcDe3DNiXn9B1L4pbMtjc+L1nSuWQPkHn7M9sYpObAuxDqJOu?=
 =?us-ascii?Q?g/OKN7614BxtSuQyG/3P7sVC4rJ0cot5heZ/NRD9qfm5ICXJ5Ci0GohY96nd?=
 =?us-ascii?Q?QlANNoW1ZTrH2i4YxOpE/K06gJZVPhCv2WscDaizHT8pn5WUHJO4d3fbKNoa?=
 =?us-ascii?Q?Wo+GKyDdrJk6fX8eeG78n2/uR2PUYHavdYqo1Y6w+B8mm3nubbAdYMXKQKoN?=
 =?us-ascii?Q?2MrXv2biT7COfh0J7d1P51Borfw5VJZfM8U5W/tXbjjnacnVTrNBWX3zzQ+O?=
 =?us-ascii?Q?AsBlXGwygKdLDSqlnn9ZW0KqVg6msVTawKi7Whl9BRLgyil5X6D++MfSmCWH?=
 =?us-ascii?Q?9M1VVjXEMTu9JUHIRJ6L5C2w/8ImsBt+QnR1YahjyM+57PjrLdcQz+mIx0V7?=
 =?us-ascii?Q?kzY90eb/FZH2s+8sW0Jg2bfaOv4j5CcW8HtPPzhi1zj+vmloA99jMz8RxdRy?=
 =?us-ascii?Q?jigevM3eS0Xs8xMq/Avt7WiJbp+v1NlOgCGs2GRLbLUEtAiYiLvIJWHZcGds?=
 =?us-ascii?Q?yNoj1wLwRBSnXCBhZt9rimxMTooFs7FAbDCPPovoTIOYyx+/ADcrMhJUjmOY?=
 =?us-ascii?Q?MXcKaOy+5pefQpNtfv21AOSh7g22EfLR2DVhhZcNEqrU68rLm2V4c8bhxA8o?=
 =?us-ascii?Q?YaKIqVCDPvHOdTh6BbDqgko0E/YVL+WtOtogTxlbMo3A0deeFoKpGoXODKdH?=
 =?us-ascii?Q?zyt6jCFfclk7rBHENsMTmXzGlp7a3W+kFAJKP9y3cSjHjH92Ts0i6dkK9cXW?=
 =?us-ascii?Q?q3AN1SjtyLq6T4XIdeJxzvICsyBKZZBeueMYWKbWVqEnZM6+ZyJilKWkoF/w?=
 =?us-ascii?Q?XbejIRJdQ569eyxP2rZFG3RNY/OD/Yd+HvS25Wl4oFtW+UFQ8EbTXdYrUbN7?=
 =?us-ascii?Q?pBWGVduiWrDjBScyT/QAupORL8SiyAZ9n0Y/CK3dIgYpXq0hmiWZalwYClKD?=
 =?us-ascii?Q?n7zEDmxT0sf0ByDRcJJQkR8924uXDKVp4arlK7ZubV1vnZdl3ikUeAEh3+J5?=
 =?us-ascii?Q?RKxfNVnqtPMdpaQ8KwODaaJfuXeCp02HppahNne23VILj/LUFrOqDJrbsPJq?=
 =?us-ascii?Q?DxDmYJWzWN150WhQzsckDgFgTikc0ybBYx3hMe8Fk2MZWDkk2g4+8LRKsXff?=
 =?us-ascii?Q?fIm0dli6d5B6jEgSN4zVy6yY78ljUi0WopsaUPbjQcQMc+x5rZSlUqhbh+47?=
 =?us-ascii?Q?gn8q4Dl+Q2AtRayIcZ4X3f+vOWjWTB9A2O8vzzBz37xA6X9KvdyESJAfb2Fe?=
 =?us-ascii?Q?Cy3aWY8B72yq4UV03j0ZNHIogbnFTgHOwe6CdpcETs4bQ60D7j+uqdQkxdRq?=
 =?us-ascii?Q?01Cs4dBrB+ryu35fYt/rv9NQaSPXKbmLtYqJmUdVHdWPy4tveub/jncBTQTw?=
 =?us-ascii?Q?p7gR42N6YKzCZxA+1fKz3pSXEPtwDDjeQRGGmU63wJgCr9B/lHr2ezrydSbb?=
 =?us-ascii?Q?qJreWEfFh62tjN/qgVZPIFqUkT1o6/mnLK/ZR6jXrsB0ikW9YiJChmnlYait?=
 =?us-ascii?Q?bZl7cNa0G4rfb2AoROv0DksYu4Sbb5pSp35oeTCdTKE7hF68dyLc9ovIxBRx?=
 =?us-ascii?Q?yMJIfq+WFHLgjYMGX2x3S/6Tk/XewWBL3q/wwwREiZRGZVYU2v1t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0077c356-858f-4a9e-b745-08defd6b3910
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:56:50.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35H2vWiL0Tt538rytdmQzJduJU6CmVu8xzyIU8c0BjsQbk6MHtnif9Ql2+4ASl+TpPpLfp+rUpDWSkcPcwI8ZTbWbSzwtfqZxfUmYiRd3uo2YEi0BfnkcogexvEG0Dfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

On Mon, Jul 27, 2026 at 12:48:41PM -0600, Logan Gunthorpe wrote:
> Each channel already gets its own struct device (dma_chan_dev),
> registered with device_register()/device_unregister() and torn down
> correctly by chan_dev_release(). Let drivers add their own sysfs
> attributes to that device directly, via a new dma_device.chan_groups
> field.
>
> This avoids drivers needing a second, separately-managed kobject to
> expose driver-specific attributes. That's a use-after-free issue:
> kobject_put() can invoke the ktype's release() and free the structure
> embedding dma_chan while the core (or the driver) still expects to
> reference it afterward, so avoiding it requires careful ordering and
> bookkeeping that's easy to get wrong. The channel's struct device
> already has the correct lifetime, and sysfs_create_group() supports
> the same named-subdirectory layout (attribute_group.name) that a bare
> kobject would provide.
>
> To let show()/store() callbacks safely recover the struct dma_chan from
> the struct device they're attached to without exposing dma_list_mutex
> itself to drivers, add a small dma_chan_from_dev_lock() /
> dma_chan_from_dev_unlock() pair that take / release the lock, and
> wrap them in a dma_chan_from_dev CLASS so callers can write:
>
> 	CLASS(dma_chan_from_dev, c)(dev);
> 	if (!c)
> 		return -ENODEV;
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/dma/dmaengine.c   | 27 +++++++++++++++++++++++++++
>  drivers/dma/dmaengine.h   | 19 +++++++++++++++++++
>  include/linux/dmaengine.h |  4 ++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 9049171df857..060a0a482eb3 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -161,6 +161,32 @@ static struct dma_chan *dev_to_dma_chan(struct device *dev)
>  	return chan_dev->chan;
>  }
>
> +/**
> + * dma_chan_from_dev_lock - take dma_list_mutex and convert a channel's
> + *	struct device to its dma_chan
> + * @dev: the channel's struct device, embedded in struct dma_chan_dev
> + *
> + * Returns NULL if the channel has already been unregistered. Pairs with
> + * dma_chan_from_dev_unlock(); see the dma_chan_from_dev CLASS in
> + * drivers/dma/dmaengine.h.
> + */
> +struct dma_chan *dma_chan_from_dev_lock(struct device *dev)
> +{
> +	mutex_lock(&dma_list_mutex);
> +	return dev_to_dma_chan(dev);
> +}
> +EXPORT_SYMBOL_GPL(dma_chan_from_dev_lock);
> +
> +/**
> + * dma_chan_from_dev_unlock - release the lock taken by dma_chan_from_dev_lock()
> + * @chan: unused; matches the value produced by dma_chan_from_dev_lock()
> + */
> +void dma_chan_from_dev_unlock(struct dma_chan *chan)
> +{
> +	mutex_unlock(&dma_list_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dma_chan_from_dev_unlock);
> +
>  static ssize_t memcpy_count_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> @@ -1098,6 +1124,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>
>  	chan->dev->device.class = &dma_devclass;
>  	chan->dev->device.parent = device->dev;
> +	chan->dev->device.groups = device->chan_groups;

why not call device_add_groups() with const groups, so needn't save
"device->chan_groups" at all.

Frank

>  	chan->dev->chan = chan;
>  	chan->dev->dev_id = device->dev_id;
>  	if (!name)
> diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
> index 53f16d3f0029..224126e64d54 100644
> --- a/drivers/dma/dmaengine.h
> +++ b/drivers/dma/dmaengine.h
> @@ -182,6 +182,25 @@ dmaengine_desc_callback_valid(struct dmaengine_desc_callback *cb)
>  struct dma_chan *dma_get_slave_channel(struct dma_chan *chan);
>  struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
>
> +/*
> + * dma_chan_from_dev_lock() / dma_chan_from_dev_unlock() bracket a critical
> + * section across which a channel's struct device can be safely converted
> + * back to its struct dma_chan: dma_chan_from_dev_lock() returns NULL if the
> + * channel has already been unregistered, and the lock it takes must be held
> + * for as long as the returned channel (or anything derived from it) is
> + * accessed.
> + *
> + * Use these through the dma_chan_from_dev CLASS below rather than calling
> + * them directly.
> + */
> +struct dma_chan *dma_chan_from_dev_lock(struct device *dev);
> +void dma_chan_from_dev_unlock(struct dma_chan *chan);
> +
> +DEFINE_CLASS(dma_chan_from_dev, struct dma_chan *,
> +	     dma_chan_from_dev_unlock(_T),
> +	     dma_chan_from_dev_lock(dev),
> +	     struct device *dev)
> +
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index b3d251c9734e..f4e7861b2507 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -803,6 +803,9 @@ struct dma_filter {
>   * @dev: struct device reference for dma mapping api
>   * @owner: owner module (automatically set based on the provided dev)
>   * @chan_ida: unique channel ID
> + * @chan_groups: optional NULL-terminated array of sysfs attribute groups
> + *	added to each channel's struct device, for driver-specific per-channel
> + *	attributes
>   * @src_addr_widths: bit mask of src addr widths the device supports
>   *	Width is specified in bytes, e.g. for a device supporting
>   *	a width of 4 the mask should have BIT(4) set.
> @@ -886,6 +889,7 @@ struct dma_device {
>  	struct device *dev;
>  	struct module *owner;
>  	struct ida chan_ida;
> +	const struct attribute_group **chan_groups;
>
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> --
> 2.47.3
>
