Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C8138D3F2;
	Mon, 31 Aug 2026 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143456; cv=none; b=XD0WHS3FbCXp5JXoBnijf2LO/B9KBMKl2U4WZ9H3CxDw7EdlO2VMybaJ2nmE6HyrFzMElQOErslCQRzgx5RoTyZU6AdqVj4ICBebrP6yVmNvvK5y8tyV9YJguoXJrFD7MNGsfPfHk5izjVcUq77fx9t5KDBdhB1ahtcajlLo7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143456; c=relaxed/simple;
	bh=6ghp3RGBehZDtPDU48Vx6qfFAngKsZaNigLnDf6bHX0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=limG5wzXrGfxoysAht8Hje9Jcaw/rB/3cNZzAwu+O8hKJfZs2bM0ukIa4884JI0nf+6fuDK1Z/sT9cRXQvUoU8xqv0aUwrlBUitnPzaah/JVK0Z9t6f0NULwi6w3R0Fik9R32EriyzaLSGlz1eHtksItpu3zGuHUEGtrrWekJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=hzkuRIfi; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="hzkuRIfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=TfIway6eq1flOSKqEPgU1i1pYANxJIpA4
	1xiYEQQJKY=; b=hzkuRIfic8jpsGNTu11A+Ezwbf5sLJ8avgdtfiZld3QeSpKkN
	y7lrAHwXIVcQTNtYX19G0KuDeh7Z3/ExM/W/xQ5+HimFsAK8LvF3QOGTcqtMz2jW
	gIQxtJTYt7n7AJCu+MnU1ZB2UZnZx/461UFY9U1yvgZ3oWHNowc/c6J+zw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwD3vwYz55RqMhMAAA--.111S2;
	Mon, 31 Aug 2026 10:30:11 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
From: Jia Wang <wangjia@ultrarisc.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <apHiTZRqN0UV87pW@SMW015318>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
 <apHiTZRqN0UV87pW@SMW015318>
Date: Mon, 31 Aug 2026 10:29:59 +0800
Message-Id: <178814339995.2265494.11412237902179967094.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788143400; l=2389;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=6ghp3RGBehZDtPDU48Vx6qfFAngKsZaNigLnDf6bHX0=;
 b=WWsXNj+5Yyvflqik66frN84MbO9Xbk3kxRT/elgznqhb69HNqv8ajOG+ok5ZlaYdByJctYrgZ
 xq976+zGiakAo5AVaFplWD7NvMY+H2gC0fWFXkaRp2/e2X02cr5kucS
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwD3vwYz55RqMhMAAA--.111S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8XF4DCF1DXF43tr48Crg_yoW8KF45pa
	n5Ka1rJFyktwn2ka1kXa4j9FyjqFy5KrW0vw48Za4SkFWDXwnavr1kKw1F9r1kAF4rtr4f
	tF45XFyrZr10vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAjsu

On 2026-08-28 14:32 -0500, Frank Li wrote:
> On Fri, Aug 28, 2026 at 08:48:26AM +0800, Jia Wang wrote:
> > The snps,axi-max-burst-len property describes the number of beats in an
> > AXI burst, while the ARLEN and AWLEN fields encode that value minus one.
> >
> > The driver keeps axi_rw_burst_len as the actual burst length so that
> > dma_device.max_burst reports the correct value. However, it also programs
> > that unencoded value directly into the hardware fields. A value of 256
> > therefore overflows the 8-bit fields and can cause AXI decode errors.
> >
> > Subtract one only when constructing hardware descriptors, while keeping
> > the actual value for dma_device.max_burst.
> >
> > Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> 
> suggest switch to use FIELD_PREP() later
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Thanks, I will add a separate cleanup patch in v2 to convert these
register fields to GENMASK() and FIELD_PREP().

Best regards,
Jia Wang

> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index eebed2474210..742e08cfab43 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -706,7 +706,7 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
> >  	ctlhi = CH_CTL_H_LLI_VALID;
> >
> >  	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> > -		burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
> > +		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
> >  		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
> >  			 burst_len << CH_CTL_H_ARLEN_POS |
> >  			 burst_len << CH_CTL_H_AWLEN_POS;
> > @@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
> >
> >  		reg = CH_CTL_H_LLI_VALID;
> >  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> > -			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
> > +			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
> >
> >  			reg |= (CH_CTL_H_ARLEN_EN |
> >  				burst_len << CH_CTL_H_ARLEN_POS |
> >
> > --
> > 2.34.1
> >
> 


