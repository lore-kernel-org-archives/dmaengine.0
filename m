Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA04BA1E8;
	Tue, 15 Sep 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493880; cv=none; b=rhJ7dqi6awZUNUe9o/pT1emKe4K8IOjn5Pai977EalJvUvsupaVpD2SaoP3VhjJNBkIAr+cUE37N7xVb16+2Z9cSrW/gLqkMi3i1xC7u0OeRE90k3blwgipfISX9zz8vw73rPsGH8OQHQQPDZAbifcIrKpfSyVs2l62lemRbZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493880; c=relaxed/simple;
	bh=vqM+loLbVQ49Pio2gJlkeeQf7kRbEE26cSbGvNtSZPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XygMW6C+4v5skxyG6+MQJKGAq1INKQawoZTOVEoiHBx4g1AyW7LjDIxClWqFPvGj+x/sZWeXGhTfkdg9fOxf1s15T3Qh0IoMxJ8DZqRubKHtmB0cGUjI6DVb06BDvL8zbHlo7POsepBBIdkXRtSfQStmwEOOWiAA0OiZWc64YDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BamemBGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BamemBGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F081F000FF;
	Tue, 15 Sep 2026 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493878;
	bh=lNOmklwMT3+8WwCRItuHkffYh/JkNHAawYZ2FWhI2k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BamemBGZLZEiNhzMEf53sH0aaBEGi/k7AS44kJ1lRb72jC2kMNobzBmsJjmYi4HPs
	 B3BxYdYFv/95wWGhWlLtkqBX084LIjizXy765ex13o62PZFGhuQviruML7X3jHwNl9
	 0pBZowc7i0vXoSJ36xFtqKoLH+7c4x2aqEU7AkRvQm/QJ8Z+CuVFktxBjV6HHmU4Am
	 SNP34f0gL9dnEuASoKHV0rsWJZA9AnRTZfio88imGgIc0sdlsWCvj7RHjEONeIg+/P
	 jmiGOUetPwMRYR6sordYsfjRBHVv/2mvRiomODvdIsnUBQPIotj1bZ6YcTKlGPOz3o
	 UbkETCel8UBVA==
Date: Tue, 15 Sep 2026 23:07:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v1 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aqmCcXRa3EIsIU6k@parshuram>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>

On 15-09-26, 12:04, Andy Shevchenko wrote:
> No more users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
