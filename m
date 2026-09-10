Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1B49DBAF;
	Thu, 10 Sep 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049428; cv=none; b=JARz+21w8BJlR/K8uFJOcX4ZoHBaI7BczVnERZ9+3/Oe38dFWFR8RmKKEv5NEsREGalZInJIoZ2vMLsGrJMOqSVf7r+SmYDqALXb8eXm43BSNdz+NTu7fZA7TbTg+tyaG5xaWJ9J0oq6KnndSp2ssxyu0+seApxrpHs+QHQQZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049428; c=relaxed/simple;
	bh=FZ750d8DEqlaaTwMMnCihwEmOTZvi8IYbG0190M6Uwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kgern8MF8BZKODgJKb76Q+3Q3BN/ooAjz4Aqqx7FYz4pNHiKp7OrcFMDZZSGWxqCOZrzBxXcwRJCUi0Mg7SjwLhAxO2srKYJ9m/zsHgxPA4F4YlKZjtID57b7TXPtq9xdgBbBqi4vAGc4rFU968LVAlqg7F2kLta+yJQI3lmjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EE1eQ4AQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EE1eQ4AQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704071F00898;
	Thu, 10 Sep 2026 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049426;
	bh=BVh+c1w/MApJIX5NGTrzLSwDmYxaSf95cG2YGBV6jnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EE1eQ4AQ6DilmYyShZYfk7OQSa5TpNWj+fpiN33qnn+q96JvB68W+5NolUsWXNUJ1
	 uYcppNkZ9safRhLAXgrJFF9nDtV6FHdFGU9K71MTssIEPYE41eUTCsiSayCOgG1kEU
	 Zy0M7edxNThZNQu4vTcn8i2VoEmU/acyIATlgC9OB0CE06yacjOn3H/jzizXhOTIBw
	 hd1DMYAgCVhjoOtjOGBekwPj2oHjN8K27sT05n+N5YvUKydvEqqBgQe65FzwNgyW0r
	 NgVH3jep0V5L0x4uqPl1BiDnsIuRwgMgZ/47xX1QhHmju4Zv9oQT9wjrX6IfJ7CH1W
	 gUK5AeBtPuZGw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
References: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Subject: Re: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part of
 channel clean up
Message-Id: <178904942399.118320.9651195155247346564.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:23 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Aug 2026 17:09:31 +0530, Aniket Randive wrote:
> The gpi_ch_init() error handling paths do not fully clean up resources
> when channel initialization fails.
> 
> The unwind paths iterate over the original channel pointer instead of
> the channels stored in gpii->gchan[], preventing previously initialized
> sibling channels from being properly reset and deallocated.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: gpi: Fix resource leaks as part of channel clean up
      commit: dd27c3f4d6108556b74b5f3f4d1d885269e7ffa3

Best regards,
-- 
~Vinod


