Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1EA3AFCF0;
	Fri, 28 Aug 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909717; cv=none; b=EHw4aMsAFbHeDtk+UKxFIb7v1r7WwpwW7nlkqcnfWy3ILGefIRwkyJn1qvmBU71gn3pMOhCtNpiV14Dwgx/W33nsUzDYSgNiiXCwQUgqx4LXfYTlSXJT3BeHH2cVQ7JWGrz4+Penhn/SqH8bRJnMnhHA0rrXdDfqWSynNSFp57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909717; c=relaxed/simple;
	bh=2GRJ1RHDOJWyELR9rwDbxFyngjy0bVk/VdMyjJkk11Y=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=q+aE4k5H8NrftEqXkIXF3hCg7t57U4ptkYnfbzA9spkSoSRdlFReG1CoDzxnRoF+EN9vpinyN7HwNwizElAEAIuuarRAEy5Z6nzSFKDYi/FU8Ker5pb2xJL0RV2WG7tP2XgqjuKJE80mB+gAtD3IQtoPLcj5x11cqrsHmNkw/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=Q/qPSyPy; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="Q/qPSyPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=gqj796rglebLooFM91re1gYWvE2vRl4JT
	g2ttyIVpII=; b=Q/qPSyPydMeGojGqwZyq8bCbnQ1IOmGfuoK8ajVQjENFMl3E0
	VwML90/SluC6wpCPaq0bqcwU4+2LhY1Gp7WSsV/gVXk2ec/eQa3+njl8hRoB1KAG
	qgG6M9HFzXsHp2W3yg92tDcgAySma82O1Z8SjD1afjBzBfEPC0ssUGzW94=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwB3V85QVpFqpGoBAA--.604S2;
	Fri, 28 Aug 2026 17:35:12 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <apEyX4mTTMiSE4_0@ashevche-desk.local>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
 <apEyX4mTTMiSE4_0@ashevche-desk.local>
Date: Fri, 28 Aug 2026 17:34:59 +0800
Message-Id: <178790969949.157024.12722626804390466513.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787909699; l=1008;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=2GRJ1RHDOJWyELR9rwDbxFyngjy0bVk/VdMyjJkk11Y=;
 b=Y4mYayODiuxTUfN07+MAm9wUSRrF9qhV1NEOq74AApcT+9Ojs5YG5EylMuTbNNWuUiiYVjIta
 QTXDRe7WvviA3iKpr5CJ3UKqT9yIEx5UaHd9jaQO5pfS5YPJAIPGFze
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwB3V85QVpFqpGoBAA--.604S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy5trWfGr4UKFW5trWrXwb_yoWfZrg_ur
	W2vrnrur45ZFWUXa15KryUGwnFk3WUXFZ8Kr95ZanYvF1vya909w4vgrs3Zw1rX39IyrnI
	kF1Sqay7Cr429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUpwZcUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAZsU

On 2026-08-28 10:01 +0300, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 08:48:27AM +0800, Jia Wang wrote:
> > axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
> > walk the hw_desc[] array of a single transaction. If multiple
> > transactions have allocated LLIs, the channel count can exceed the
> > transaction-local nr_hw_descs and make the DMA error path read past the
> > end of hw_desc[].
> > 
> > Use the descriptor-local nr_hw_descs count when dumping LLIs.
> 
> ...
> 
> >  {
> > -	int count = atomic_read(&chan->descs_allocated);
> >  	int i;
> >  
> > -	for (i = 0; i < count; i++)
> > +	for (i = 0; i < desc_head->nr_hw_descs; i++)
> 
> While at it,
> 
> 	for (unsigned int i = 0; i < desc_head->nr_hw_descs; i++)
> 
> and drop that 'int i;' as well.
> 

Will update it in v2, thanks.

> >  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
> >  }
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

Best regards,
Jia Wang


