Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940093;
	b=EzqMFDi0MkpUb6nYl/11E4Qm0FkxhVN5apDMWY72CBG9Leu5M8YDA4+sMqDcr07RpHid
	 BFWPVSX45/2UvQHGrRI+6Y1KQL6us4R/6D5rdBptrWE9kFdQnZD8uL99KYo/EfHj+ok9T
	 zWBu6hjP8IPUNnsrCzSg2PeapaalMGA9itH41M17HrHE48qPe6CFQjgfyCGL93i9Bkwfp
	 iAv9bGOC+dl7JGQhdu4uv6LcIe42gXJbD8nxATvXw0pgpTfvzdzRaijol3FNKZGmNMplU
	 p2JXr+Zl0m+oBLug5B9PGj4xQB/C/G5Laq07p2xwNIRsZyhO8vnevA007LJ8MAqg+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940093;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=korbg7m2/TbtqPgo8sxH4xfzvfV/2mKsNq65LW7R+ds=;
	b=TaRcJDwVJeuLMTbs3jutMFCgKFdEm6hfL3aG2uTp0b+eiYTl75dJHpGnkpuD4Aq6OQSC
	 inFKq8aSKxXZJFex7B/PdvxrRjHXOTjQhoNaC8inXp7YsR/T1AF+xV+rmrcZOBZPJPbsp
	 //LFnDuEajfCyUt/hWUw8QGzNx1H/R3p2/v8TzNl1s2dyDTrf3/ayhtRYTchCtbbIV6Ox
	 D4/yR0Q444O55Tcdf+EAv9Kjsuiwj0ch7Vr7HI3Nd8SeKiD9mmWBv6bj4qcF1BE9nsMht
	 x0Iuag96hrmqO8Ju6AuZu9KJ1oSwHfq4n/BX3lP7apqqTjQ4GkF1MHOVm8IgOdMQrGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=fvHxjg3y;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD428606A32A;
	Tue, 17 Nov 2026 18:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD428606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=fvHxjg3y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=korbg7m2/TbtqPgo8sxH4xfzvfV/2mKsNq65LW7R+ds=; b=fvHxjg3yc33WDFyLzOuGp62/Cg
	g+kV0C9O/eY4uhCMslNXy3KDQEqEcNlqREPEPGSxIdS0lEpDq86Q6ib34m5kKl5VID1x6D6XHkKyp
	OpLtRp/mn/Nee9CEEVSxL07lIb+/QHS+0e2D8mbt2NsGPpfhedD6X0Z2SAPSn3jKxAgc7BBM8Xqa8
	Q6fqaTwkIhdB8qIf0+QwN4TNkXuHR1tQk503RYMrBVB8ih6u/G6NCgEortBh+8PlRKxpgrl3d7VPZ
	3WfRS4KNXcCgHDwmJIHwxC/vZtR4Q4JjzxUHz8MWjhT/roSvUchSjX+0YDQhjhp839UV2KXxcYLkN
	WU32Q/pw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTNuc-00000001SZK-28xu;
	Tue, 17 Nov 2026 12:28:11 -0600
Message-ID: <b3058fbd-151a-4cb4-b5fe-e55964d5f8a3@deltatee.com>
Date: Tue, 17 Nov 2026 12:27:50 -0600
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
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Dave Jiang <dave.jiang@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Kelvin Cao <kelvin.cao@microchip.com>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-2-logang@deltatee.com>
 <avyWCL7TzS9JX4Ys@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <avyWCL7TzS9JX4Ys@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: Frank.li@oss.nxp.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v4 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-17 11:59, Frank Li wrote:
> On Tue, Nov 10, 2026 at 11:31:33AM -0600, Logan Gunthorpe wrote:
>>  static ssize_t memcpy_count_show(struct device *dev,
>>  				 struct device_attribute *attr, char *buf)
>>  {
>> @@ -1117,6 +1143,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>>
>>  	dmaengine_chan_dev(chan)->class = &dma_devclass;
>>  	dmaengine_chan_dev(chan)->parent = device->dev;
>> +	dmaengine_chan_dev(chan)->groups = device->chan_groups;
> 
> if echo channel have same groups, why need copy it to dma_chan?

The groups pointer belong to each channel, so each dma_chan must set its
groups to the chan_groups pointer stored in the device. The only way to
add these groups is to set dma_chan->groups to something and the pointer
stored chan_groups is exactly what it is there for. I can't see any
other way to accomplish this. It makes no sense for each channel to have
different groups.
>> +/*
>> + * dmaengine_chan_from_dev_lock() / dmaengine_chan_from_dev_unlock() bracket
>> + * a critical section across which a channel's struct device can be safely
>> + * converted back to its struct dma_chan: dmaengine_chan_from_dev_lock()
>> + * returns NULL if the channel has already been unregistered, and the lock
> 
> where return NULL when already been unregistered
> 
> static struct dma_chan *dev_to_dma_chan(struct device *dev)
> {
>         struct dma_chan_dev *chan_dev;
> 
>         chan_dev = container_of(dev, typeof(*chan_dev), device);
>         return chan_dev->chan;
> }
__dma_async_device_channel_unregister() will set chan_dev->chan to NULL
while holding the dma_list_mutex lock.

Thanks for reviewing this,

Logan
