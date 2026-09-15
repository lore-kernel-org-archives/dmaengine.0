Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75713B0AE4
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481771; cv=none; b=Trkv+ul8zvntaedS3XsZc0ePrpAMgM7k2o68wkEtUO0pAS6zRT1OFBVWyvpAQTLmRQtEF+y/fxHE4JzWXs/55K40wCoPkta2KjFrwYhaDp2g+tVIFmEAyJxuCsDyDeDzt4rKewaqlR2jVR4Ea4Vku0Pp1LcNcQPblWmkzYLmRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481771; c=relaxed/simple;
	bh=cQUpihWQioTqstYxEXwVnyTIzezJVnL2wsOroTfdHY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc44+arqHJi3ATT5S1myA4fvcmm+vpTqp368Mi1bBMgLNxGOzZBmXkIiqklp1v12cf57Hr+rSpsK927tbtAdHa+8ZbMUyfOPpJn3OKRRvad1k5VDwxEgb8V5rl9g4pmBm6QtNu2FrhqrtnXm0nngbUoZcXp09dxniEwm/hHgQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIMg5q6p; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIMg5q6p"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so2454665e9.3
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481768; x=1790086568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=JIMg5q6prxl7f9V8AmVU//Et9nhxOQ/KsomRNTlxLGqdaZyTZxw4U6VBTHvk4XH0BV
         R8nXfRqvjgLdxEzyN3LXb+Bgxtsqi0bdCuemI3yK39pIE+5EqkpgW0paKoTPGp0g78oU
         4jZuSfO4WJ+DcCgzVd0kKKivYLKuU9t+lCH/xnNZUZ9cEroFW5kPYQX3dK0SVYnMJ5uw
         m+tJI9dSJNhegNiFD3vuIFrMzaSSo+Lr5zlZR2Rdqgg/WAAo9ee0jYbKmfApi/n5vQPR
         nmpIivN4crg1eD9EhUKBJWMso28EdLEonRNFJDzpr9fPeu+oW+b2pVnv2IBLiYE3Ghba
         sXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481768; x=1790086568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=N/B9CBjhNcXa4342OWoJFz9FAjus/ZKRXYG3kSv8V0wYhTrCUeSecS1LYc6u9vGnfn
         at46eJ+357Jd02DECP0YU8W6hHAwxEUxN/qMDVJa5uGo5UyO2FvDiCu62G7OG4yacBcM
         PiGGQU2W9UqaaUqpFKQaen/YVkL3JDiXV/BjPgxLcggs/uUQg5cwp77nSuO7lj+Nmlsa
         1opkOtWCOLmF5VoWUq9s4O2Tcdl1YHrF2p+LVyztY5+UYduJzNvodI8dmwnxMUQDL5gN
         y37UTCT5Liy1gWB404NlN6W1eSsZH3SmlVzmctrDXdYTxLHI4PL7UgFk2kSLshiLXT4R
         vjsg==
X-Forwarded-Encrypted: i=1; AKwUvByM9dOGXGQpHJvDDmU5Rx3h3NaSZubNoy0SkcPx3idJwgPe7UMrcPdFK27FfPb1Xy7P6b8FF01fkdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lcr8DESXmai2JfWyftmURMI/oej5HH1ugIp6mJyruUKQ77YCdR
	VFxj7/6AgvurMhvLM0iAGdUSwB4Ly4CeyeGmrrSVImZQZ6O/19T59SLo
X-Gm-Gg: AYBFou3rCRr/pMPvV0v1AAwZbPo3JngVMJUG+lCOgGybflg1ygwLi79uXVt7zl3haZn
	MFfbwZ0WUkx2v4ohr0tCV8SBYlNjU6aUejyOYOay4reL66ixOInkF2myp5jwm5DZW/gzOOqmuhB
	4hsrdzEBD1KxaybbWUQzSOMwGMohzWxRhozGtHAyluo+QvURo6qrSW3NP/2rI4w3IymINIau0IC
	Kk3aeWEKKOPSfz+QmqQv/TSl8yOFKX8P9YXOukLCz1MTvcfMJZUHDOfSaz7ca5FO7BUMK17CtYa
	zGxtmUBXVONY3a48lTEo7m1qq/MhPL3M3WT6ZU4Mgou/tt8iTEMs7OABEaPnCxJl72dJy6Xe+8n
	WlsGaOLiak1grP7DD5lch9CcUfiCL3n+kfdggdCRrtI3LMLryjmrdu8vVDqqAlWaqhLwPIKaKgz
	6Ss1+QXnLWPqi4W+lj8tpVGpT7zYE8wkxOoHqcwNfdvH+8M7eRJHtyS3/fAjbXSaO/moKY0KSh7
	dEOl1di+se5hX71jAudT/dR
X-Received: by 2002:a05:6000:188b:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-4870a99c862mr1258242f8f.22.1789481767808;
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm35209776f8f.29.2026.09.15.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:16:05 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Message-ID: <aqlTJcVHi5CXTyjy@egonzo>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>

On Tue, Sep 15, 2026 at 12:04:27PM +0200, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpib/fmh_gpib/fmh_gpib.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
> index 5e10e9353fed..3fdcc673ec8b 100644
> --- a/drivers/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
> @@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	e_priv->irq = irq;
>  
>  	if (acquire_dma) {
> -		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
> -		if (!e_priv->dma_channel) {
> +		e_priv->dma_channel = dma_request_chan(board->dev, "rxtx");
> +		retval = PTR_ERR_OR_ZERO(e_priv->dma_channel);
> +		if (retval) {
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
> -			return -EIO;
> +			return retval;
>  		}
>  	}

Reviewed-by: Dave Penkler <dpenkler@gmail.com>
