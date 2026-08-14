Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF3335066;
	Fri, 14 Aug 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738077; cv=fail; b=LN+O9MzriOjVxXWXGUkbTpyVGxGLWdAwmTZzxStony9A3tTI9j8U0eEVJ+eqXz+N+Ue48knVoicurSdjWAfmeKP72pyTTQhqKKXMLwz/vS0uuWJ1uT9iIZ5AQ3WaQ6EHm6i5UPOoCfZIUC3CrD3dlKULly5ydBlWGQBPvd7Wopk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738077; c=relaxed/simple;
	bh=F4GGUISsUGBxLglpeiPN2KBAKfGZby8qsZFC31//lgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZksmXDPyWerwTQMV6MhH2acKxwC4CgAtUkPdOdvUh9tiGd6M/kXHn10HvNGCbVtPsznor0iS3MNzOfI2wdzUolg2G8GvcIcbwJQDygHjtuqeM4cf854CyKftvSJWfAyqnd6v3ZAuQsSvpr3A6K2HtWwKBSVl35vcFy9OEQtKMcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=axDYCtbi; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="axDYCtbi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOiIJfkYvsFSv9VKJQhjqu6U1ExoSEzUUiVcRfZjayXVCpzNWAAZHbIvfOJKbCp36f464LgfnWCW9J9lKRUtE30+aozZS9OYkvn1Ij7n/G/hiyxtXHzhbtQD1MMQHwDC+96P4nWwTqge5/qAzZ+TiblAzwvXLf0eg4ralSjoPy6oBp5S1jNB2DWj+K9CvkPWmMqGz1d2zqxEZ+lysXdI+OkO1gyvQtLy4y49JWqmPnhnDYUyVA9NpOI26Z3Z8PvWPucEOZP4ix8TfTRfZPmW94kIZSB9RkKwHGPrzF11N6rvQQb7VFbi8LwWFo/0WjjnyHKjLqRi8nHx/OffU9KAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdRckh58mOgDqjsxf/b+5exMiMDI8OvRDp79ADe13AI=;
 b=k/MYfLZ73woBnm97tbW3/HlfuugbIhdVxGxL+Axux2j7IlvXOGO2l0nitn4o+cMcBKWT6zDjBoQ+FEPNplcvH2i7hJhc2R84xVnUYEnEQy6KEIwnVhB92D5Xi406d1rOC1KCCBEGxu1RnmQO3pFRL2PezlWgkjsdAY7r8a3DpZ4pZLBQgvPBbme84tY0C4HYhCOpGvGaDijZayJ7IbYbJnOiq+TS3+OgQUuLPfNkaQygluTKuEicsox1nyZJMxuj9kTQTO9n/4ZD1DLBPLg/Z/ZbkXh9ljVKovL60k3+jDPUgmMUG5BiweHp071nK2Cpikq+U9Csfcl3QCm6yZfZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdRckh58mOgDqjsxf/b+5exMiMDI8OvRDp79ADe13AI=;
 b=axDYCtbi5kt1uBlaXvn5cG5+gRgTaRPv7714s5PnyRMubi8LepVQ2YomZEzpixNV1p1aHdpQH5Du9Ey5aJ53T83svWGtxm5j2jiMLGaZGZ9d4C4KfsZkhc6qvEtSvw3q6S+AzdxoM5aQTdhaGEBnTGzkkDyGOT8OJPgiWXV5Sb0RNmKILXo/YMsJLwDUoqNpZmIxA9O8BBGTOzAPEjc0Dyh6zo1XWsKEUW/9qwXSb6/klDPHzIGlvXYYXaFgEtX07vvuoBoTNL6h/eUt7H9/qiPJbhVQ6z16TBPj9HP03SIX3RBnKpiAEGUvm06ukINmKW/TBubH+YbwbrjQR1S+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7206.eurprd04.prod.outlook.com (2603:10a6:10:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 20:07:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:07:52 +0000
Date: Fri, 14 Aug 2026 16:07:44 -0400
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
Message-ID: <an91kOBKJuPtllP0@lizhi-Precision-Tower-5810>
References: <20260727184844.12647-1-logang@deltatee.com>
 <20260727184844.12647-2-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727184844.12647-2-logang@deltatee.com>
X-ClientProxiedBy: PH8P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bee882e-2ddc-4a52-b70e-08defa3fb89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1emqSzY96xizAplzwoJq8c/N0sbcqvFvNZlIlmznLnzJY7NyKH1+RHnhYR92wsfcx3o9E8yxcF370P9XxqB2cTfiZFtnzpdFLII/0XkAkU8A6/xf5WTROOBb8YWPN+nK5/RedKw7cp7M7yzdr/dFDSzrr7SKNXGv7GBeoMIkgz5hTkLOr2OTUXATzs26hJILMgRjQxr2qa2IfF/iItNpGlkoft4cPV3kZ0VMFt75IDLor1LVAyoQT+3yopODetTTLHQvdnJ4rgZvDRFomaweUjUrEyhG2+tovxtzzCWg5Jpdg07hrS4q73zYSDHj0c/YVanaCAWOqV3SRC9TGq3Kz8AqhKz1o9yDKMrpzaRhheKu7DYVVmdXTyU25gn7eaOnWKdPtuG8kKte6uxknew4H9Bk9dI00HYlFrpqJ/aHx49ith7c2quZKNwKDS/RUoXCVIpR2CO498dC7iEw+mgzQOQECj28GArY6xXXa9uW+oe+VqqoYnozJFMuvULbDewqy77MoTMx/CO8/WvZ/aF6bUgl+JYs79ERbRU2JpaHaVFEetiikZ3CP6mA0Si/VNG96o3IoD4aWxDld58ef2qyA+97dbty6n5QqQvfRDprrYygWTThP637o2ztCcTFXpOibCX9XQCm1nBH1CnQOGEUGrbCz/tD2us8OkrM+xGgiVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMso+eeYKrCvgfdBHZtoorHdKPh+GJ8rghla+ZHlRycEYq41i1fvSYaxQbrj?=
 =?us-ascii?Q?YPh6fZp/miBFOGFESZt2xP5HMov84v2fnA+FcT4e7xdPOk5kGZyN0OAEXMBM?=
 =?us-ascii?Q?o46W0JytDRquiBxq/pu+CcT8DmmjqGVNmkgzRzvrUN9ZJyx7uC86XjR/lh18?=
 =?us-ascii?Q?3SylUkJ3QWHYBv9P64o0D9CA1WklgxPUctbm2fthZz9eRgSlCpyoHOJMblA3?=
 =?us-ascii?Q?olYhPs6o2852Q9Bxcg72u9pTrCkzIJKo9CD2BUDa9oufqDXBoAutzprZ7UEX?=
 =?us-ascii?Q?n5y7JW1KG4AJaygxnoOkx8tOCyCdRo7vYtjSgAjGtOaP4zIYMHJgxFL/K5GY?=
 =?us-ascii?Q?3ARnNwC7SSwGFp9MDbybcPdRCn4DHb/ocD0GD39nW5cb0NpMB/2eCsge5F8F?=
 =?us-ascii?Q?rH4HkaxrJv1Cul4hdQdSBOkafkW3SWUdut3XmHDkmSj7ucvBPK978uojqy+/?=
 =?us-ascii?Q?uPwjLqPzJ1EYtXs2ZTBNCAk+7iHbseZPVdy0bQuaKqjZqSvrbUEeG2In3iG5?=
 =?us-ascii?Q?1f09+B/fVH8ZP1Rdiwn8NFfo+h8VQDUKpQY0umcImrq9+sl1zuVbgAQgXuay?=
 =?us-ascii?Q?YheZJyd5W6nlxsFzVXU5DS2Jp3yFuBEpZ9Vg/dHnFCNw4XXcad76+GgfpykG?=
 =?us-ascii?Q?mg+upj2dLWGGdIi/KcgXaF0CfRWcZu53sdGp7LEKFw4TDRSxI/sXDG/714qY?=
 =?us-ascii?Q?bejlFVUqdjfNDvCwh1nT/w976AnDonNhbgnEhaKo9qkmttQvfKet/ap8Uc27?=
 =?us-ascii?Q?4zgTWGFrTAcGMVW+VMigRaNDDDUNgIg9oMZvG6sOpzjfXfDviy/vhq8NijnO?=
 =?us-ascii?Q?Ybu73FCPKO2yjD7WKuLzBd96SqpseMRx8jEZ3g5hRAKEFNH1ea6q9alciUMs?=
 =?us-ascii?Q?sDuKkM2QZY99YF3BVqdBEU40ct8jXsGyvmoydGcyB2aEmZsG20bsr2+8nuJj?=
 =?us-ascii?Q?y5zYL6FdoypsHHHJnkcOgLrLdnNozlOx9QufdfAAK+Lppydzx8/GtQ4pfxPp?=
 =?us-ascii?Q?CdcF/dlcVfafGimk8797ZmwRuiJVsCpW2xTn0ED4VYKFviwnd0laNg0Cnv9T?=
 =?us-ascii?Q?ScjgM+QwK5DHa2YiUdGZBaJ6lHpybV05CmcL/pJLxpeWPLUxGyTFnsV68yYY?=
 =?us-ascii?Q?7C2z0Hw9/6n+tD71kLnL1NFUq9xmqTvaPH4RHBSs3U94ChOCxmadJme9i22L?=
 =?us-ascii?Q?+W7XINyHO9K81ZSU9W3AM2ickzOgvmR3YE8mvRS/Ic7t8T9qg8e3em00/bmn?=
 =?us-ascii?Q?9wZGjApAKyA/7FZCFGLo/IkgJ84n2F6Y1ljEuI/lLKEFE40g+c9A+hRMibFS?=
 =?us-ascii?Q?Pm7fMKPvdUM8tdT/WvirzN9N/HlSImD8U2rqizpB/mjtU+utbJp+5tiNaCVd?=
 =?us-ascii?Q?r6ycW1YiqDaS6iuk6nixMrLJHrMk5qA3o4+hcRzaBm3hW0nJjCOjeRtcX/Eh?=
 =?us-ascii?Q?JY40ioMyzyHTf8HF1rjPLkzYGut2hgqwieYs4bQl0tPmCa8TxxmwY/1HdmQT?=
 =?us-ascii?Q?PZFpXLnd1kee30Z1oNSV55svMmltbiTjV4zZs+neYEFMb/zS9LTyrSvQc97f?=
 =?us-ascii?Q?mWPa4NtPJHoIBWr6JUMAvEq9p9OAhe3D213UdA1A1fptXC7YHYYvxDleGJzT?=
 =?us-ascii?Q?UavF1nm7XW3ImMQQ3XzNMXvybLFORGzwe9o5QI5vymPEKZ3WyyZNSyIUQ6ai?=
 =?us-ascii?Q?W4poTfgr3n8Xlih7HXPmsFjtihQEorEg7JSoONs25H1wdBO168aZcI7kUd2I?=
 =?us-ascii?Q?Kd7FLJE+Vow8cM0NUQpkJeO+wVBTKLwCm7unhdAYTQ4hZEL1wZVt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bee882e-2ddc-4a52-b70e-08defa3fb89f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:07:52.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgfHfDkEfAZjOaKxaSJabbSw/YE+EscTa7jC4B+1n+UF5QKa3LUeyXHcqPJgPBx9m5jwlaK6v+VOAdXjCF8eGvSByROLy9j5SmGmaVwHO+I1+uTypY0N3pnk18Zh3tva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7206

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

New dma API should start from dmaengine

Any one outside dmaengine need access dma_list_mutex? I'd like use
dma_list_mutex directly.


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

It is per channel group, why not put into dma_chan struct.

Frank

>
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> --
> 2.47.3
>
