Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C243CEE1
	for <dmaengine@vger.kernel.org>; Thu, 28 May 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981231; cv=none; b=HJifqwu2KoN2wjpgt6CkkmKaKF6+M7qQt9e+9E7zP4eBHY4NEujNVjixFtO3rQIXgC5u8vaIAXVRkbdDi+6oi6scvB5z6yAY7E6/e2WtJr+y0S36/U9GI7imrmd1uV2UACpOm4ZHsbZELK8y5tCs8RGtNniccXK67/Ut7jhyXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981231; c=relaxed/simple;
	bh=FJd6Ow6ZjvBerP48vVU6PTbgHP8sGuKIIOzXCALxe2o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPYFTEe6XSfBOWh7XspLtdgUVANZpnKXyhuPa7mPmlZzbYI4s0aUWJzkDZgUr5qrUoStPR2zjiUNwxjbLeLJLbtoxO9iTwsYUnKGVbqBqnAlHvlmwL80N6Y8prcOWTtJJaeq1ui5mWigwCG2ydnaEvPwX5wTmfUQW/697tcwKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XM0ihtFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XM0ihtFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00861F00A3D
	for <dmaengine@vger.kernel.org>; Thu, 28 May 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779981231;
	bh=FJd6Ow6ZjvBerP48vVU6PTbgHP8sGuKIIOzXCALxe2o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XM0ihtFuKlaj2Q+ij8MnGf8bVvf/tzEW3R96SQwgeqyOCvCbk6DhupNhvhrP4vel3
	 243XFysTSmXZoCwxu4aaqrsa9eTfJHQ+q7UopLEns/87nkc6M9auPBO8QQqz8traXU
	 t/Bzq3FKE9AVziBlOjdM7PG89u0mPiWq0rJLopYF910LSI3lZBYbtHq/Jx5zWUsXPM
	 RlNExfyup57sVHwaSfKHguokmmfk8aYx7R4AqHi3as6kiHgoiRSGAWuqFw5AM/jp8d
	 fCqxCt3DFB6GCgG8fkOKn+JL1/hruhzrJDA+op1722JgNQtKeI2vOO/vIlXyOau3L9
	 fs5BtsMNLOr7g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d07e8938so15171491fa.2
        for <dmaengine@vger.kernel.org>; Thu, 28 May 2026 08:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yRh39RO0DQFAsyKHq43DWuiogDJLwUNPej/LJ9QlHiR5UtM13sswn8jCuzdtXvWYF7TpBJOx7VoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6m1IKDUhyHZBAB36Ij0Q9LwhkU1OvIk78gcTdYgYyPfLQbps
	hr4bomSfc1NC3gWmJFJISMHbb34NWpl+FEpWpygrYvFDGfPlDuZIt8SAJDAq0XyrQ2wNqlYwGzt
	0eKoeNcgIFFNybXMaHynGsFHOoKTIvDDQ9R38ACfrpw==
X-Received: by 2002:a2e:a817:0:b0:394:3edb:eb82 with SMTP id
 38308e7fff4ca-395d8c35a0amr92059321fa.1.1779981229695; Thu, 28 May 2026
 08:13:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 11:13:47 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 11:13:47 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <lj7geczhthury476ilkjym2k5fblo5pqroefsbdfgh5jcf7zy2@qrss5xc7umn3>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com> <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark> <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark> <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
 <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com> <lj7geczhthury476ilkjym2k5fblo5pqroefsbdfgh5jcf7zy2@qrss5xc7umn3>
Date: Thu, 28 May 2026 11:13:47 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me6cqasdBknbAjUZ5BqcpERYwV+NvseRJp4P0aTSYAMUw@mail.gmail.com>
X-Gm-Features: AVHnY4Jro2v36_qh8I_EV5Xgy-Ltpq1ZYSWhSn_trIg-hl-ttPm51m6ZmzRLAaA
Message-ID: <CAMRc=Me6cqasdBknbAjUZ5BqcpERYwV+NvseRJp4P0aTSYAMUw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 15:50:10 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On Thu, May 28, 2026 at 09:13:23AM -0400, Bartosz Golaszewski wrote:
>> On Thu, 28 May 2026 13:54:51 +0200, Kuldeep Singh
>> <kuldeep.singh@oss.qualcomm.com> said:
>> >>> +Bartosz, Gaurav, Neeraj
>>
>> I know about the self-tests etc., I will address them next.
>
> My 2c, the self-tests would be more important, as they are fixes. Doing
> the crypto in a wrong way is a bad idea...
>

Then let that be "in parallel". :)

Bart
