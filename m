Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D0B37E30C;
	Tue, 18 Aug 2026 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093083; cv=none; b=JLjVu/wwSROkUNZxAl+nLinRJ4r7xk0gk0a2mZxgMHkYZEYRzobwjcoDSsK6faRaJu/iWUo2+I5DZiRE9EMYATo5AmTw5EVP9hhTYlURtwnUwle1Yndp4bFPUqgZ2Xd2PLtDSvTNundrzzrHIL5aDDeMddUuvTf3V1GYtQzfboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093083; c=relaxed/simple;
	bh=fnunXMprZO3mPFWRmJavB3a3ewKLlxJjcvWrNhjQDTQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=m+zgbbcqCgIELnvOxXxSgFxupmenGG333VK3DfLnNLUVaaH5nPoftf/cutDLdfTjKQkHbkGluCMOifx3i+9FBmFWle+3v2HuE3dCU/pFvQKTIXUhGmAf3ZJS1/vxb/+SUnjmJrtkNGaqGNRbGMdXyLw86fHWZjyVLAYjFwXTYuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=S/ZtquLf; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="S/ZtquLf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=PHmAOeSjohj6/ygGiQGX4Nxs15b8FYsKvj0bWCmDoZw=; b=S/ZtquLffRXtdC0BkHmIT3sjyz
	/oV/rkUPNWfHqu/Gn++sSqBjsvfD96GXClX4890apA1rcVjKe13Ae37xMAX14RFCexjTCMIVg1LTF
	98aFUQC0UVzkP+ep8NBt3NB4Q1mrIHeCfDzyCzchYU8qeYFMKxmgjqJ4OshlEuIEIAlVR1zr0fSHB
	UU52/FfkW756FrIsSF2hgubVwrn8rsttRk8c60HzjnClvHokp9TY78Xez8lj9xuqqM+Hm61NSFP3Z
	ApCLuvTpU8wvplsf/++YAuHlJrLMgTN0FQIGcZ4TaK8H3qok1/zEhnX3jaCf3YPT9VUtpSkFdkiOU
	zAKDnj3Q==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wwSXv-00000000ux5-3Z87;
	Tue, 18 Aug 2026 16:44:40 -0600
Message-ID: <40941ade-2522-4afd-9b4f-510547833db8@deltatee.com>
Date: Tue, 18 Aug 2026 16:44:30 -0600
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
 <aoTHCw30mgaLymfY@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <aoTHCw30mgaLymfY@lizhi-Precision-Tower-5810>
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



On 2026-08-18 14:56, Frank Li wrote:
> On Mon, Jul 27, 2026 at 12:48:41PM -0600, Logan Gunthorpe wrote:
>> @@ -1098,6 +1124,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>>
>>  	chan->dev->device.class = &dma_devclass;
>>  	chan->dev->device.parent = device->dev;
>> +	chan->dev->device.groups = device->chan_groups;
> 
> why not call device_add_groups() with const groups, so needn't save
> "device->chan_groups" at all.
That would mean each driver looping over dma->channels calling
device_add_groups() itself, which is what I was pushing back against in
my previous response, only a bit worse:

Letting the core set dev->groups is also better than adding the groups
after registration: device_add() applies dev->groups before signalling
to userspace that the group has been created. If the driver is
responsible for calling dma_add_groups() after registration, then
userspace can be signalled before all the groups are added and ready,
causing subtle issues with udev rules, etc. I'm not sure it can all be
done correctly without introducing complicated race issues.

I really think setting device.groups before calling device_add() is by
far the better solution here.

I had to go digging for this, but I was reminded of a (older than I had
thought) blog post that GKH wrote more than a decade ago to describe
this exact issue:

http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/

The recommendation: just set the groups field in the device object.

Logan
