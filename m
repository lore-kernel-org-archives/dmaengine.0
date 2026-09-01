Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40354734C6;
	Tue,  1 Sep 2026 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252577; cv=none; b=WmyUKzCLuCYHyYbZeG3GTPo45eWY4FoOJ/IdVIq/iQVXtV6VPVk9ha5lI0Kvn7BGEU2VZWnZLWQPTks/SSqJWl8Kc52KKazb1ZHXVPlAtORBDLeoQwssTDDYzkwwHkrQMzAHl5SQr+pMFJ9lYR7bbGsiPr4cZol1kterKyKlYEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252577; c=relaxed/simple;
	bh=Mu6lMUJJIPK+5hPGGm1hV53KZHWETeZW36exmUsSp04=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=X381lf61/oxsQoj1o4LjO093FLslDDkUyf3hCKM5zcsDB2J/MB9eZGQKMjQOhr5p5DvEE42BcfaJc3W7udJJjuhHyGWgAjP4udrsIATzj0lCEz+akFwlyGYbJ4J8mJHUDal4gkw8K3aw8jvf2AEJjKxjuuG86LeqMrSMjOSVPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=o6BBoLnL; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="o6BBoLnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=GfiJrhPIFXl3cBt1lBMMl2RbgU/WobnLa
	squFQnNzK8=; b=o6BBoLnL0hAGWmbBG6UVWI2Ua6oRCsUPN+W2fL97wDMqxJnRs
	oX5w4lYjiyHBMe68rEGPTE0BndVWoqI7rpao7NtA3O28wUJ5zpOGzQMENDt8WaxJ
	c4acWWWxM5Wdadal8Vrm3T0L8m0daWgE3OnXGJlMacbLhPTz28b1ngj86w=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwD3vwaHkZZqvyEAAA--.165S2;
	Tue, 01 Sep 2026 16:49:11 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/4] dmaengine: dw-axi-dmac: Use bitfield helpers
 for registers
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <apZ4cTZUHWruo828@ashevche-desk.local>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-4-d7f0459ebb14@ultrarisc.com>
 <apZ4cTZUHWruo828@ashevche-desk.local>
Date: Tue, 01 Sep 2026 16:49:00 +0800
Message-Id: <178825254003.3900827.15026517497606639650.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788252540; l=3987;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Mu6lMUJJIPK+5hPGGm1hV53KZHWETeZW36exmUsSp04=;
 b=QAfqcv5uUvtgQpAiekctzI3s0OOBO4RPkyPzwKGf408tx3txqPWXsMiQguOaIlfK4J2NRYwID
 ixfTwu6DnB3C/wDwaJ0xrH6C273Kof0zv2ivNWcExZW0yewbSuiMQtU
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwD3vwaHkZZqvyEAAA--.165S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr43ur1fKF15tryUZw45Awb_yoWrXr4Upa
	1UCr45WryqvF9YvFn0kF4UuryrZwsFkrn7G3Z5Ja17Grn0vrnavFZI93srCrnFyFnrZr4U
	KrWfWFyfWas5J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAAXsO

On 2026-09-01 10:02 +0300, Andy Shevchenko wrote:
> On Tue, Sep 01, 2026 at 02:16:07PM +0800, Jia Wang wrote:
> > The driver open-codes several channel configuration and descriptor
> > control bitfield writes with left shifts. Define masks for those fields
> > and use FIELD_PREP() when programming the registers.
> > 
> > Valid field values keep the same encoding. FIELD_PREP() confines values
> > to their respective fields, but does not validate handshake numbers
> > supplied through DMA specifiers.
> 
> ...
> 
> >  {
> >  	u32 cfg_lo, cfg_hi;
> >  
> > -	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
> > -		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> > +	cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> > +		 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);
> 
> Personally I would duplicate this to make each branch self-contained.
> 

Agreed. I will initialize cfg_lo separately in each branch in the next
version.

> >  	if (chan->chip->dw->hdata->reg_map_8_channels &&
> >  	    !chan->chip->dw->hdata->use_cfg2) {
> > -		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
> > -			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
> > -			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> > -			 config->src_per << CH_CFG_H_SRC_PER_POS |
> > -			 config->dst_per << CH_CFG_H_DST_PER_POS |
> > -			 config->prior << CH_CFG_H_PRIORITY_POS;
> 
> 		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> 			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);
> 
> > +		cfg_hi = FIELD_PREP(CH_CFG_H_TT_FC, config->tt_fc) |
> > +			 FIELD_PREP(CH_CFG_H_HS_SEL_SRC, config->hs_sel_src) |
> > +			 FIELD_PREP(CH_CFG_H_HS_SEL_DST, config->hs_sel_dst) |
> > +			 FIELD_PREP(CH_CFG_H_SRC_PER, config->src_per) |
> > +			 FIELD_PREP(CH_CFG_H_DST_PER, config->dst_per) |
> > +			 FIELD_PREP(CH_CFG_H_PRIORITY, config->prior);
> >  	} else {
> > -		cfg_lo |= config->src_per << CH_CFG2_L_SRC_PER_POS |
> > -			  config->dst_per << CH_CFG2_L_DST_PER_POS;
> > -		cfg_hi = config->tt_fc << CH_CFG2_H_TT_FC_POS |
> > -			 config->hs_sel_src << CH_CFG2_H_HS_SEL_SRC_POS |
> > -			 config->hs_sel_dst << CH_CFG2_H_HS_SEL_DST_POS |
> > -			 config->prior << CH_CFG2_H_PRIORITY_POS;
> > +		cfg_lo |= FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
> > +			  FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);
> 
> 		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> 			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type) |
> 			 FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
> 			 FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);
> 
> > +		cfg_hi = FIELD_PREP(CH_CFG2_H_TT_FC, config->tt_fc) |
> > +			 FIELD_PREP(CH_CFG2_H_HS_SEL_SRC, config->hs_sel_src) |
> > +			 FIELD_PREP(CH_CFG2_H_HS_SEL_DST, config->hs_sel_dst) |
> > +			 FIELD_PREP(CH_CFG2_H_PRIORITY, config->prior);
> >  	}
> 
> ...
> 
> > -		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> > -		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
> > -		       xfer_width << CH_CTL_L_DST_WIDTH_POS |
> > -		       xfer_width << CH_CTL_L_SRC_WIDTH_POS |
> > -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> > -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
> > +		reg = (FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> > +		       FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> > +		       FIELD_PREP(CH_CTL_L_DST_WIDTH, xfer_width) |
> > +		       FIELD_PREP(CH_CTL_L_SRC_WIDTH, xfer_width) |
> > +		       FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
> > +		       FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC));
> 
> Unneeded parentheses.
> 

I will drop the outer parentheses in the next version.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

Best regards,
Jia Wang


