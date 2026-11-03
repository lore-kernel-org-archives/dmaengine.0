Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721616;
	b=SsNOR0z5FPWj1yrR0B+SOtS1mUJTyDd6dtBCTbjkO/hQdI8szFhiM6ICzqJW273Ryh5d
	 3ZkYebiDUL07l/dQul2sEjRHhgno06axxnALw5SorXSGy8jZnZ/now0l+SiZtfGDDN8cd
	 9mTOcta3iJLKp3kXwk4KAPGxz+Q+9g7rSgykvLT1Q4kyetgQ/IC/rBdOC/G9BAxIHK++d
	 dhEDZ4+Wpb0aDnUR9XPlc2Vv8kVQFwXMXT63cD1RjO2A+MLSjXYLYaFQzevv9Ps3bf+Sh
	 5xKtUfOKBUuJwnKz+O/fBmIgzX0nFnLXulFOv5ffZTRhTMKO5huuZi3izyBuPxRc/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721616;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9dzSoEpgZH00q1wJSX9moEpvSB1iYpBLDpCufMdRJpk=;
	b=ieopSYULSChk20bfn9js3wt9sumBnfbOUFjFUNnFlwj12hwfE6QYyHukUtOR6Qu/f3z5
	 HjKKX3LOGph9bw50rcaZgRs4LcsUNJHXq44rZCCJwgQaZjmkDxrI5K9EDnhhpAthCKDsQ
	 92bXYtCZUVo1ndbMcqI6jdkY3GsIf8u/V1SuzJ49lriMxBQB/T9ne7uL1xI9bf64iMku7
	 zFxxWmPqnNCbo+g59lGRZiKuic7d6ds2y/4dDrqWLD4SdaDEJigQGq5uRgIi9HJQ3qbwI
	 AJEWdSG4pgN75bUCCjDlQtch84suBXcwqRE5N90mvt9DBdUXtZatIq+1iK4CkwKJLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nf7M8Ct5;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A3606D808;
	Tue,  3 Nov 2026 16:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100A3606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nf7M8Ct5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793721614; x=1825257614;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZmRQw/f3ox9Gd6QqlPw6u4WhtoaoRSpDpT4Lez/k8AM=;
  b=nf7M8Ct5cZzv/av65vn3EZ0uzuZe8BC4omWOEeNX00YdzrG22ASUyGvV
   UQ19wV1EoHwz1pQf1T3+MfshNE82tqD1K/4N24fpf3sADUVFRH5PYTWSh
   3t5QgsWHvOtlVnekuyd9e/RkVwOLpE9mS1c0OguPH01ILDxbnlSvPNLRb
   HVJ+LLNpUKrG9t27g9HCT05HgADhsGfw9aGkRgxEqsO9/GDHEqBSBgyNe
   GiXapVisNclQYtZVPVC0I2oBDVqgZ1zy/PyJka5Zti8ORtEaozcs765vx
   V46cAvgTDj4adGuezXQie8NFIg3dj+glKcUpNLeqK0WRZJB/Tu5gMgHgT
   g==;
X-CSE-ConnectionGUID: 2KbRiv/nQoeTqGNG4AEcCA==
X-CSE-MsgGUID: LUgFUsJISbC17/9cLdGIMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2459640"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2459640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:00:13 -0800
X-CSE-ConnectionGUID: KkVoLTGfRhKjkiaJSRGpsA==
X-CSE-MsgGUID: lYYPYe33T2y/SrHrm45WNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6806239"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.235]) ([10.125.109.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:00:12 -0800
Message-ID: <0e0bf495-ff00-45b2-98bd-d9901196e447@intel.com>
Date: Tue, 3 Nov 2026 09:00:10 -0700
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dmaengine: ioatdma: convert per-channel sysfs to
 chan_groups
To: Logan Gunthorpe <logang@deltatee.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@infradead.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Kelvin Cao <kelvin.cao@microchip.com>
References: <20261103154022.459620-1-logang@deltatee.com>
 <20261103154022.459620-3-logang@deltatee.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261103154022.459620-3-logang@deltatee.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/3/26 8:40 AM, Logan Gunthorpe wrote:
> Use the new dma_device.chan_groups mechanism to add ioat's "quickdata"
> per-channel attributes directly to the channel's existing struct
> device, instead of a second, separately managed kobject
> (ioat_ktype/ioat_kobject_add()/ioat_kobject_del()).
> 
> Each show()/store() now recovers the struct dma_chan via
> dev_to_dma_chan() under dma_list_mutex, the same safe pattern already
> used by the core attributes, returning -ENODEV once the channel has
> been unregistered rather than reading it after the fact.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/ioat/dma.h   |   6 +-
>  drivers/dma/ioat/init.c  |   5 +-
>  drivers/dma/ioat/sysfs.c | 166 +++++++++++++++------------------------
>  3 files changed, 67 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
> index e8a880f338c6..d36cc2df74ea 100644
> --- a/drivers/dma/ioat/dma.h
> +++ b/drivers/dma/ioat/dma.h
> @@ -103,7 +103,6 @@ struct ioatdma_chan {
>  	#define IOAT_CHAN_DOWN 0
>  	#define IOAT_COMPLETION_ACK 1
>  	#define IOAT_RESET_PENDING 2
> -	#define IOAT_KOBJ_INIT_FAIL 3
>  	#define IOAT_RUN 5
>  	#define IOAT_CHAN_ACTIVE 6
>  	struct timer_list timer;
> @@ -112,7 +111,6 @@ struct ioatdma_chan {
>  	dma_addr_t completion_dma;
>  	u64 *completion;
>  	struct tasklet_struct cleanup_task;
> -	struct kobject kobj;
>  
>  /* ioat v2 / v3 channel attributes
>   * @xfercap_log; log2 of channel max transfer length (for fast division)
> @@ -190,7 +188,7 @@ struct ioat_ring_ent {
>  };
>  
>  extern int ioat_pending_level;
> -extern const struct kobj_type ioat_ktype;
> +extern const struct attribute_group *ioat_groups[];
>  extern struct kmem_cache *ioat_cache;
>  extern struct kmem_cache *ioat_sed_cache;
>  
> @@ -393,8 +391,6 @@ void ioat_issue_pending(struct dma_chan *chan);
>  /* IOAT Init functions */
>  bool is_bwd_ioat(struct pci_dev *pdev);
>  struct dca_provider *ioat_dca_init(struct pci_dev *pdev, void __iomem *iobase);
> -void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type);
> -void ioat_kobject_del(struct ioatdma_device *ioat_dma);
>  int ioat_dma_setup_interrupts(struct ioatdma_device *ioat_dma);
>  void ioat_stop(struct ioatdma_chan *ioat_chan);
>  #endif /* IOATDMA_H */
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index a57024c4b066..984078920c2b 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -541,8 +541,6 @@ static void ioat_dma_remove(struct ioatdma_device *ioat_dma)
>  
>  	ioat_disable_interrupts(ioat_dma);
>  
> -	ioat_kobject_del(ioat_dma);
> -
>  	dma_async_device_unregister(dma);
>  }
>  
> @@ -1185,12 +1183,11 @@ static int ioat3_dma_probe(struct ioatdma_device *ioat_dma, int dca)
>  		goto err_disable_interrupts;
>  	}
>  
> +	dma->chan_groups = ioat_groups;
>  	err = dma_async_device_register(&ioat_dma->dma_dev);
>  	if (err)
>  		goto err_disable_interrupts;
>  
> -	ioat_kobject_add(ioat_dma, &ioat_ktype);
> -
>  	if (dca)
>  		ioat_dma->dca = ioat_dca_init(pdev, ioat_dma->reg_base);
>  
> diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
> index 976134df8108..9bdc0fbf7696 100644
> --- a/drivers/dma/ioat/sysfs.c
> +++ b/drivers/dma/ioat/sysfs.c
> @@ -14,134 +14,95 @@
>  
>  #include "../dmaengine.h"
>  
> -struct ioat_sysfs_entry {
> -	struct attribute attr;
> -	ssize_t (*show)(struct dma_chan *, char *);
> -	ssize_t (*store)(struct dma_chan *, const char *, size_t);
> -};
> -
> -static ssize_t cap_show(struct dma_chan *c, char *page)
> +static ssize_t cap_show(struct device *dev, struct device_attribute *attr,
> +			char *page)
>  {
> -	struct dma_device *dma = c->device;
> +	struct dma_device *dma;
>  
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	dma = c->device;
>  	return sysfs_emit(page, "copy%s%s%s%s%s\n",
>  		dma_has_cap(DMA_PQ, dma->cap_mask) ? " pq" : "",
>  		dma_has_cap(DMA_PQ_VAL, dma->cap_mask) ? " pq_val" : "",
>  		dma_has_cap(DMA_XOR, dma->cap_mask) ? " xor" : "",
>  		dma_has_cap(DMA_XOR_VAL, dma->cap_mask) ? " xor_val" : "",
>  		dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "");
> -
>  }
> -static const struct ioat_sysfs_entry ioat_cap_attr = __ATTR_RO(cap);
> +static DEVICE_ATTR_RO(cap);
>  
> -static ssize_t version_show(struct dma_chan *c, char *page)
> +static ssize_t version_show(struct device *dev, struct device_attribute *attr,
> +			    char *page)
>  {
> -	struct dma_device *dma = c->device;
> -	struct ioatdma_device *ioat_dma = to_ioatdma_device(dma);
> +	struct ioatdma_device *ioat_dma;
>  
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	ioat_dma = to_ioatdma_device(c->device);
>  	return sysfs_emit(page, "%d.%d\n",
>  			   ioat_dma->version >> 4, ioat_dma->version & 0xf);
>  }
> -static const struct ioat_sysfs_entry ioat_version_attr = __ATTR_RO(version);
> +static DEVICE_ATTR_RO(version);
>  
> -static ssize_t
> -ioat_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
> +static ssize_t ring_size_show(struct device *dev, struct device_attribute *attr,
> +			      char *page)
>  {
> -	const struct ioat_sysfs_entry *entry;
> -	struct ioatdma_chan *ioat_chan;
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
>  
> -	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
> -	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
> +	if (!c)
> +		return -ENODEV;
>  
> -	if (!entry->show)
> -		return -EIO;
> -	return entry->show(&ioat_chan->dma_chan, page);
> -}
> -
> -static ssize_t
> -ioat_attr_store(struct kobject *kobj, struct attribute *attr,
> -const char *page, size_t count)
> -{
> -	const struct ioat_sysfs_entry *entry;
> -	struct ioatdma_chan *ioat_chan;
> -
> -	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
> -	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
> -
> -	if (!entry->store)
> -		return -EIO;
> -	return entry->store(&ioat_chan->dma_chan, page, count);
> -}
> -
> -static const struct sysfs_ops ioat_sysfs_ops = {
> -	.show	= ioat_attr_show,
> -	.store  = ioat_attr_store,
> -};
> -
> -void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type)
> -{
> -	struct dma_device *dma = &ioat_dma->dma_dev;
> -	struct dma_chan *c;
> -
> -	list_for_each_entry(c, &dma->channels, device_node) {
> -		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
> -		struct kobject *parent = &c->dev->device.kobj;
> -		int err;
> -
> -		err = kobject_init_and_add(&ioat_chan->kobj, type,
> -					   parent, "quickdata");
> -		if (err) {
> -			dev_warn(to_dev(ioat_chan),
> -				 "sysfs init error (%d), continuing...\n", err);
> -			kobject_put(&ioat_chan->kobj);
> -			set_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state);
> -		}
> -	}
> -}
> -
> -void ioat_kobject_del(struct ioatdma_device *ioat_dma)
> -{
> -	struct dma_device *dma = &ioat_dma->dma_dev;
> -	struct dma_chan *c;
> -
> -	list_for_each_entry(c, &dma->channels, device_node) {
> -		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
> -
> -		if (!test_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state)) {
> -			kobject_del(&ioat_chan->kobj);
> -			kobject_put(&ioat_chan->kobj);
> -		}
> -	}
> -}
> -
> -static ssize_t ring_size_show(struct dma_chan *c, char *page)
> -{
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>  
>  	return sysfs_emit(page, "%d\n", (1 << ioat_chan->alloc_order) & ~1);
>  }
> -static const struct ioat_sysfs_entry ring_size_attr = __ATTR_RO(ring_size);
> +static DEVICE_ATTR_RO(ring_size);
>  
> -static ssize_t ring_active_show(struct dma_chan *c, char *page)
> +static ssize_t ring_active_show(struct device *dev,
> +				struct device_attribute *attr, char *page)
>  {
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>  
>  	/* ...taken outside the lock, no need to be precise */
>  	return sysfs_emit(page, "%d\n", ioat_ring_active(ioat_chan));
>  }
> -static const struct ioat_sysfs_entry ring_active_attr = __ATTR_RO(ring_active);
> +static DEVICE_ATTR_RO(ring_active);
>  
> -static ssize_t intr_coalesce_show(struct dma_chan *c, char *page)
> +static ssize_t intr_coalesce_show(struct device *dev,
> +				  struct device_attribute *attr, char *page)
>  {
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>  
>  	return sysfs_emit(page, "%d\n", ioat_chan->intr_coalesce);
>  }
>  
> -static ssize_t intr_coalesce_store(struct dma_chan *c, const char *page,
> -size_t count)
> +static ssize_t intr_coalesce_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *page, size_t count)
>  {
>  	int intr_coalesce = 0;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>  
>  	if (sscanf(page, "%du", &intr_coalesce) != -1) {
> @@ -153,20 +114,23 @@ size_t count)
>  
>  	return count;
>  }
> +static DEVICE_ATTR_RW(intr_coalesce);
>  
> -static const struct ioat_sysfs_entry intr_coalesce_attr = __ATTR_RW(intr_coalesce);
> -
> -static const struct attribute *const ioat_attrs[] = {
> -	&ring_size_attr.attr,
> -	&ring_active_attr.attr,
> -	&ioat_cap_attr.attr,
> -	&ioat_version_attr.attr,
> -	&intr_coalesce_attr.attr,
> +static struct attribute *ioat_attrs[] = {
> +	&dev_attr_ring_size.attr,
> +	&dev_attr_ring_active.attr,
> +	&dev_attr_cap.attr,
> +	&dev_attr_version.attr,
> +	&dev_attr_intr_coalesce.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(ioat);
>  
> -const struct kobj_type ioat_ktype = {
> -	.sysfs_ops = &ioat_sysfs_ops,
> -	.default_groups = ioat_groups,
> +static const struct attribute_group ioat_attr_group = {
> +	.name = "quickdata",
> +	.attrs = ioat_attrs,
> +};
> +
> +const struct attribute_group *ioat_groups[] = {
> +	&ioat_attr_group,
> +	NULL,
>  };

