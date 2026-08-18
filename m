Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDC47ACF7;
	Tue, 18 Aug 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071238; cv=none; b=fEutDriDeQBqD1QMSgLLyQt++B5uRRshmp+qYFrTYFZ4PkPnTBmQTs06lY0b00VUDoWWoSRTUYgVyJQU6rK9FXVYWomVkRZ8uYzYCAq0hLG1RoTd66UyCKQ+yBAsto7iQ1c4GJS8spmjorX/T+wkGaIMvYtcbS2xD0KAqkzlgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071238; c=relaxed/simple;
	bh=ab+BzBqTiN5cy70DgdsFmeOQ0UN7uyR3m/ojNB3J5Hk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=dqAbYetlz+jn/EsV6PjGE69Rc6SZY8H43VCOpW8EO8NQGUNhM0IWaYcphV0Vl6FPWcTJAU1TIhhC28VweyELLNw9X8Ku2pMWepM76RLeN8Plxvi4jOPWjEkAkHLL01z+5AOPCK5ZcpJ+u/kJIZrTmJbSmZ7Kg37Nv4mzVd1BTes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=T59p0QXZ; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="T59p0QXZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=JjzeprFssd1MD6zaUxfKcI0AWHywnUdKArgN9WwhQ5g=; b=T59p0QXZ21pgjuu6ZPEqzslveJ
	08dliXsCB1a+OSJQTuGKE5Y/jH8xuVOuPjhFNedpC4N2MSfx+p+UXwMAms/tnOhCZ4+/oOITc1jIi
	Hp3IxgcNXL3euOmpoHzoEwiH3wR8hhod90n8P9ZbfDxNZ8NjGUPNEf0DMjHBiIer7K2ecnsvffhEd
	xkHIM//OCRHbIRPdN+aIGWxksqp4cwtwGMnwTISuyIR+IKWAUAjY7TTHT8xWXESff7qeg4ziAjPA2
	Px4JgfnEA2g9KUntHgqB+g5roIRXAgneuInxynNpdluIXVtowpyiTzj+QGNHMLTwzYQMZCBWCMUOo
	Bgod5A1A==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wwMrb-00000000qEK-14kO;
	Tue, 18 Aug 2026 10:40:36 -0600
Message-ID: <89993112-bcda-4617-b3e7-36a974c27c5d@deltatee.com>
Date: Tue, 18 Aug 2026 10:40:23 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Dave Jiang <dave.jiang@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Kelvin Cao <kelvin.cao@microchip.com>
References: <20260727184844.12647-1-logang@deltatee.com>
 <20260727184844.12647-2-logang@deltatee.com>
 <an91kOBKJuPtllP0@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <an91kOBKJuPtllP0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: Frank.li@oss.nxp.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Thanks for the feedback!

On 2026-08-14 14:07, Frank Li wrote:
> New dma API should start from dmaengine

Will do -- when I send v3 (probably after the next merge window).

> Any one outside dmaengine need access dma_list_mutex? I'd like use
> dma_list_mutex directly.

This does need to be exported so it may be used in both ioat and
switchtec-dma. It's used indirectly via the dma_chan_from_dev class
helper so it's use may not have been entirely obvious.

>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h>>
index b3d251c9734e..f4e7861b2507 100644
>> --- a/include/linux/dmaengine.h
>> +++ b/include/linux/dmaengine.h
>> @@ -803,6 +803,9 @@ struct dma_filter {
>>   * @dev: struct device reference for dma mapping api
>>   * @owner: owner module (automatically set based on the provided dev)
>>   * @chan_ida: unique channel ID
>> + * @chan_groups: optional NULL-terminated array of sysfs attribute groups
>> + *	added to each channel's struct device, for driver-specific per-channel
>> + *	attributes
>>   * @src_addr_widths: bit mask of src addr widths the device supports
>>   *	Width is specified in bytes, e.g. for a device supporting
>>   *	a width of 4 the mask should have BIT(4) set.
>> @@ -886,6 +889,7 @@ struct dma_device {
>>  	struct device *dev;
>>  	struct module *owner;
>>  	struct ida chan_ida;
>> +	const struct attribute_group **chan_groups;
> 
> It is per channel group, why not put into dma_chan struct.

I'd like to push back on this lightly. While it may be a per-channel
group, each channel would almost certainly be the same in all cases. So
it's wasting a pointer for every channel that will always be the same.
And the switchtec driver will need to add a new for-loop to set them
all. A snippet of a patch below shows how this would affect both
drivers. I'd personally perfer to leave it, but if you still think it's
better the other way please let me know and I'll change it for v3.

Thanks,

Logan



--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -1164,6 +1164,7 @@ static int ioat3_dma_probe(struct ioatdma_device
*ioat_dma, int dca)
      list_for_each_entry(c, &dma->channels, device_node) {
              ioat_chan = to_ioat_chan(c);
+             c->chan_groups = ioat_groups;
              writel(IOAT_DMA_DCA_ANY_CPU,
                     ioat_chan->reg_base + IOAT_DCACTRL_OFFSET);
      }
@@ -1183,7 +1184,6 @@ static int ioat3_dma_probe(struct ioatdma_device
*ioat_dma, int dca)
              goto err_disable_interrupts;
      }

-     dma->chan_groups = ioat_groups;
      err = dma_async_device_register(&ioat_dma->dma_dev);
      if (err)
              goto err_disable_interrupts;

--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -1769,7 +1769,9 @@ static int switchtec_dma_create(struct pci_dev
*pdev, ...)
      dma->device_synchronize = switchtec_dma_synchronize;
      dma->device_release = switchtec_dma_release;
-     dma->chan_groups = switchtec_groups;
+
+     list_for_each_entry(chan, &dma->channels, device_node)
+             chan->chan_groups = switchtec_groups;

      rc = dma_async_device_register(dma);
      if (rc) {

