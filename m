Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33941D22B;
	Tue, 15 Sep 2026 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469692; cv=none; b=Ir988FxfzqvOdZ4RbXfs+0OedxZYdAM9VL+duYE7GVDvlBSp3CfSpd5XIiPsFuPmjT/uYvghyaVukLMqq0tx7IUN5hXXV0UT8UbQWvD7avAh+yVgz7Yc9dsIJk+g0RA3lGjtolK+FKgH6VjIZbNdJFBZ889RdUtBG8NBwx9+ZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469692; c=relaxed/simple;
	bh=v5Jo0MPZVCelv+Z4UsEgSEUj4zV9YuPQ2fGaKsZiBsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOZU/pNN/wQeLhinneB30FxFv+7PJLPuBed7y5EZ2uan7XSJxoRp3tR7Z1LwfxRQVvwQWY+jpmqaBSBCviq+r5+5Gu0WBUXpCLzaMqvuhSGbB2281ex1s7K1v20cUOya34pUkipMCjJWh6HITRNxW6Fj7kVoAy8xIdCiftwUM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kHy1/37s; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kHy1/37s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789469681; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=3NcK+2D6AazFJjSTKxR7cSuvqpA99SwORYNVJbXxAeM=;
	b=kHy1/37sXJUJJN5yCjuUQgQVdWyXFJJyRc1jIgSd22HOtkYAXjxbcV+uqcIDxzgIaMOQR9XIGWzZTx9y6cqj9PB5WBF46bF0RjJyp1flBKZYXRWi2yy3OfyplQXWCt+3gYNvVpKrsqLekPglBvMFpN+SxFaSQ9ShrX4shfZXu3w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=33;SR=0;TI=SMTPD_---0XB1P4.X_1789469678;
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB1P4.X_1789469678 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 18:54:39 +0800
Message-ID: <ccd08979-d702-4dc7-90cd-f82c08c5182c@linux.alibaba.com>
Date: Tue, 15 Sep 2026 18:54:37 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel() by
 dma_request_chan()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Lars-Peter Clausen
 <lars@metafoo.de>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/15/26 6:04 PM, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
