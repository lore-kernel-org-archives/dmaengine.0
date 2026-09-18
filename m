Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C1483833;
	Fri, 18 Sep 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754290; cv=none; b=j0hyGTlkwAuHHdF6Rci/8p9FmCYHGldkz8ZkCTl924sLoRK5rvkCA4pCZ+vO6AnLiaiY2NB2/YNP1BvtbW4WJIYee3yYGjGoouboUAnIWSOhdADShKRs/KJs/8xCk0soHnU+Dn2ZhweQOROvIIyas60J2jMqfvSkcDoRgoYC6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754290; c=relaxed/simple;
	bh=Uim/QizBNxw+rb7fl90AGnbHkpW/ncADgxNBrB6/k5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFuY58TTdjN+fjSgOqAUlMlRymgphRK8RosPm8SAwbYkPFS0LHWVmWGewGo1/uLqL+nv96FbOKjaBWW8bJNA+QFC0XGMrd7E5gJPt9wP+Nb8yjYASQVzSb01/V1XmSqyJTQk+63zsFF0ZnV/Ejsn4lBF7NixMMRPDWcSKDK4z0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFMZj+mJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFMZj+mJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6E61F000FF;
	Fri, 18 Sep 2026 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754286;
	bh=1l9FecZC20se1cRT+U2yFyGnQU1PHlnfgdsZtd2O88c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFMZj+mJxhvA4HWpVg8jsWxsjw/8Tku/xdTQdIfmCtvNrKQzG71Pq6lO5l7ogAmu3
	 xSxmkOGz51hepFCStCNGeCu/+Ze5Hd4Fn69/4WxiIoM3QKK7tKKDKmxELKSqW0X9Fp
	 MSTVj0C6gLx6vnYO7pvWlRDtUefL9itkMCiphZ2iVsKY/0rWOf1+NOr2bwnqdQFuqD
	 u4KKWJz30R6brUDDVRIhYk63gWXR7L+QGUw8mSwfkwLZv0Zl8ZKiK8/3yrzQjZv775
	 XHh3z5QI+9nuenRHdEA4MblSnGphwadG3ucTl6ozc2y0hmaoE+g5hdfUnPX3Cuxxd0
	 awqMuDYbtnpEA==
Date: Fri, 18 Sep 2026 23:28:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
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
Subject: Re: [PATCH v2 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aq17qvmxF6nwclkR@parshuram>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>

On 18-09-26, 13:34, Andy Shevchenko wrote:
> No more users.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I thought I had acked earlier one. Here is it again


Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
